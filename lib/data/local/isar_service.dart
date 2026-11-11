import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/beneficiary.dart';
import '../models/growth_record.dart';
import '../models/attendance.dart';
import '../models/thr_transaction.dart';
import '../models/home_visit.dart';
import '../models/awc_infra.dart';
import '../models/sync_queue_item.dart';
import '../models/clinic_referral.dart';
import '../models/aww_alert.dart';

class IsarService {
  late Isar isar;

  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [
        BeneficiarySchema,
        GrowthRecordSchema,
        AttendanceSchema,
        ThrTransactionSchema,
        HomeVisitSchema,
        AwcInfraSchema,
        SyncQueueItemSchema,
        ClinicReferralSchema,   // ← new
        AwwAlertSchema,         // ← new
      ],
      directory: dir.path,
      name: 'little_steps_db_v6',   // ← bumped from 'little_steps_db'
    );
  }

  Future<void> close() async {
    await isar.close();
  }

  // ---------------- Typed helpers (so UI/repos don't touch raw Isar) ----------------

  Future<int> putBeneficiary(Beneficiary b) async {
    return isar.writeTxn(() => isar.beneficiaries.put(b));
  }

  Future<List<Beneficiary>> allBeneficiaries() async {
    return isar.beneficiaries.where().findAll();
  }

  Future<Beneficiary?> findBeneficiaryByQr(String qrCode) async {
    return isar.beneficiaries
        .filter()
        .qrCodeEqualTo(qrCode)
        .findFirst();
  }
}

/// Global singleton
final isarService = IsarService();