import 'package:dio/dio.dart';
import '../models/beneficiary.dart';

class AiService {
  final Dio _dio = Dio();

  // ⚠️ REPLACE with your laptop's IPv4 address (run `ipconfig` on Windows)
  static const String baseUrl = 'http://192.168.56.1:8000';

  Future<Map<String, dynamic>?> predict({
    required Beneficiary child,
    required double weightKg,
    required double heightCm,
    required double ageMonths,
  }) async {
    try {
      final response = await _dio.post(
        '$baseUrl/predict',
        data: {
          'child_id': child.id,
          'age_months': ageMonths,
          'weight_kg': weightKg,
          'height_cm': heightCm,
          'gender': child.gender == Gender.male ? 'M' : 'F',
          'health_issues': child.healthIssues.map((e) => e.name).toList(),
        },
        options: Options(
          receiveTimeout: const Duration(seconds: 60),
          sendTimeout: const Duration(seconds: 10),
        ),
      );
      return response.data as Map<String, dynamic>;
    } catch (e) {
      print('AI_SERVICE_ERROR: $e');
      return null;
    }
  }
}

final aiService = AiService();