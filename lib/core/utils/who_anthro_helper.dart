import 'dart:convert';
import 'dart:math' as math;
import 'package:flutter/services.dart' show rootBundle;
import '../../data/models/beneficiary.dart';

typedef LmsTable = Map<int, List<double>>;

class WhoAnthroHelper {
  static final Map<String, LmsTable> _cache = {};

  // ---------------- Internal helpers ----------------

  static Future<LmsTable> _load(String assetPath) async {
    if (_cache.containsKey(assetPath)) return _cache[assetPath]!;
    final raw = await rootBundle.loadString(assetPath);
    final Map<String, dynamic> decoded = jsonDecode(raw);
    final table = <int, List<double>>{};
    decoded.forEach((key, value) {
      table[int.parse(key)] =
          (value as List).map((v) => (v as num).toDouble()).toList();
    });
    _cache[assetPath] = table;
    return table;
  }

  /// Load two tables and merge (for 0–2y + 2–5y splits)
  static Future<LmsTable> _loadMerged(String a, String b) async {
    final t1 = await _load(a);
    final t2 = await _load(b);
    return {...t1, ...t2};
  }

  /// Box-Cox Z-score formula.
  static double _zScore({
    required double measurement,
    required double l,
    required double m,
    required double s,
  }) {
    if (l.abs() < 1e-9) return math.log(measurement / m) / s;
    return (math.pow(measurement / m, l) - 1) / (l * s);
  }

  /// Find LMS row for a given key (day or cm), with nearest fallback.
  static List<double> _lmsFor(LmsTable table, int key) {
    if (table.containsKey(key)) return table[key]!;
    final keys = table.keys.toList()..sort();
    int nearest = keys.first;
    for (final k in keys) {
      if ((k - key).abs() < (nearest - key).abs()) nearest = k;
    }
    return table[nearest]!;
  }

  static int daysBetween(DateTime dob, DateTime at) =>
      at.difference(dob).inDays.clamp(0, 2190); // cap at 6y

  static int monthsBetween(DateTime dob, DateTime at) {
    int m = (at.year - dob.year) * 12 + (at.month - dob.month);
    if (at.day < dob.day) m--;
    return m < 0 ? 0 : m;
  }

  /// 0–5y = days 0–1856
  static bool isWhoChildRange(int days) => days <= 1856;

  // ---------------- 0–5y: WAZ / HAZ / WHZ ----------------

  static Future<double> waz({
    required DateTime dateOfBirth,
    required DateTime measuredAt,
    required double weightKg,
    required Gender gender,
  }) async {
    final path = gender == Gender.male
        ? 'assets/who/wfa_boys_0_5y.json'
        : 'assets/who/wfa_girls_0_5y.json';
    final table = await _load(path);
    final lms = _lmsFor(table, daysBetween(dateOfBirth, measuredAt));
    return _zScore(
        measurement: weightKg, l: lms[0], m: lms[1], s: lms[2]);
  }

  static Future<double> haz({
    required DateTime dateOfBirth,
    required DateTime measuredAt,
    required double heightCm,
    required Gender gender,
  }) async {
    final table = gender == Gender.male
        ? await _loadMerged('assets/who/lhfa_boys_0_2y.json',
            'assets/who/lhfa_boys_2_5y.json')
        : await _loadMerged('assets/who/lhfa_girls_0_2y.json',
            'assets/who/lhfa_girls_2_5y.json');
    final lms = _lmsFor(table, daysBetween(dateOfBirth, measuredAt));
    return _zScore(
        measurement: heightCm, l: lms[0], m: lms[1], s: lms[2]);
  }

  static Future<double> whz({
    required DateTime dateOfBirth,
    required DateTime measuredAt,
    required double weightKg,
    required double heightCm,
    required Gender gender,
  }) async {
    final days = daysBetween(dateOfBirth, measuredAt);
    final under2 = days < 730;
    final table = under2
        ? (gender == Gender.male
            ? await _load('assets/who/wfl_boys_0_2y.json')
            : await _load('assets/who/wfl_girls_0_2y.json'))
        : (gender == Gender.male
            ? await _load('assets/who/wfh_boys_2_5y.json')
            : await _load('assets/who/wfh_girls_2_5y.json'));
    final lms = _lmsFor(table, heightCm.round());
    return _zScore(
        measurement: weightKg, l: lms[0], m: lms[1], s: lms[2]);
  }

  // ---------------- 5–6y: BMI-for-age ----------------

  static Future<double> bmiZScore5to6({
    required DateTime dateOfBirth,
    required DateTime measuredAt,
    required double weightKg,
    required double heightCm,
    required Gender gender,
  }) async {
    final path = gender == Gender.male
        ? 'assets/who/bfa_boys_5_6y.json'
        : 'assets/who/bfa_girls_5_6y.json';
    final table = await _load(path);

    final heightM = heightCm / 100.0;
    final bmi = weightKg / (heightM * heightM);

    final months = monthsBetween(dateOfBirth, measuredAt).clamp(61, 72);
    final lms = _lmsFor(table, months);
    return _zScore(measurement: bmi, l: lms[0], m: lms[1], s: lms[2]);
  }

  // ---------------- Classification ----------------

  /// 0–5y classification
  static NutritionalStatus classifyChild({
    required double waz,
    required double haz,
    required double whz,
    double? muacCm,
  }) {
    if (muacCm != null) {
      if (muacCm < 11.5) return NutritionalStatus.sam;
      if (muacCm < 12.5) return NutritionalStatus.mam;
    }
    if (waz < -3 || whz < -3) return NutritionalStatus.sam;
    if (waz < -2 || whz < -2) return NutritionalStatus.mam;
    if (haz < -2) return NutritionalStatus.stunted;
    if (whz > 2) return NutritionalStatus.overweight;
    return NutritionalStatus.normal;
  }

  /// 5–6y classification (BMI-for-age Z-score)
  static NutritionalStatus classify5to6(double baz) {
    if (baz < -3) return NutritionalStatus.sam;
    if (baz < -2) return NutritionalStatus.mam;
    if (baz > 2) return NutritionalStatus.overweight;
    return NutritionalStatus.normal;
  }
}