import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../data/local/isar_service.dart';
import '../../../data/models/attendance.dart';
import '../../../data/models/beneficiary.dart';
import '../../../data/models/thr_transaction.dart';
import '../../../data/repositories/attendance_repo.dart';
import '../../../data/repositories/thr_repo.dart';
import 'package:isar_community/isar.dart';
class QrScannerScreen extends ConsumerStatefulWidget {
  final BeneficiaryType type;
  final AttendanceKind kind;
  final bool isThrFlow;

  const QrScannerScreen({
    super.key,
    required this.type,
    required this.kind,
    this.isThrFlow = false,
  });

  @override
  ConsumerState<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends ConsumerState<QrScannerScreen> {
  final MobileScannerController _controller = MobileScannerController();
  String? successName;
  bool processing = false;
  bool _justScanned = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _onDetect(BarcodeCapture capture) async {
    if (processing || successName != null || _justScanned) return;
    final code = capture.barcodes.first.rawValue;
    if (code == null) return;

    setState(() {
      processing = true;
      _justScanned = true;
    });

    final b = await isarService.isar.beneficiaries
        .filter()
        .qrCodeEqualTo(code)
        .findFirst();

    if (b == null) {
      if (mounted) {
        setState(() {
          processing = false;
          _justScanned = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('QR not recognised in this centre'),
            backgroundColor: AppColors.danger,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
      return;
    }

    if (widget.isThrFlow) {
      await ref.read(thrRepoProvider).provide(
            beneficiaryId: b.id,
            item: ThrItem.takeHomeRation,
            verification: VerificationMethod.qr,
          );
    } else {
      await ref.read(attendanceRepoProvider).mark(
            beneficiaryId: b.id,
            kind: widget.kind,
            verification: VerificationMethod.qr,
          );
    }

    if (mounted) {
      setState(() {
        successName = b.name;
        processing = false;
      });
    }
  }

  String get _successMessage {
    if (widget.isThrFlow) {
      return '$successName — THR Provided Successfully!';
    }
    return '$successName — Attendance Marked Successfully!';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.navy,
      body: SafeArea(
        child: Column(
          children: [
            _topBar(context),
            if (successName != null) _successBanner(),
            const SizedBox(height: AppSizes.sm),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(AppSizes.lg),
                child: _scannerBox(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSizes.lg),
              child: ElevatedButton.icon(
                onPressed: () {
                  if (successName != null) {
                    context.pop(true); // return "true" = something was scanned
                  } else {
                    context.pop(false);
                  }
                },
                icon: const Icon(Icons.qr_code_scanner_rounded),
                label: const Text('Done'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _topBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.sm,
        vertical: AppSizes.sm,
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () => context.pop(successName != null),
            icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
          ),
          const Expanded(
            child: Text(
              'Scan QR',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 48),
        ],
      ),
    );
  }

  Widget _successBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppSizes.lg),
      padding: const EdgeInsets.all(AppSizes.md),
      decoration: BoxDecoration(
        color: AppColors.success.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
        border: Border.all(color: AppColors.success.withValues(alpha: 0.4)),
      ),
      child: Row(
        children: [
          const Icon(Icons.check_circle_rounded,
              color: AppColors.success, size: 22),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              _successMessage,
              style: const TextStyle(
                color: AppColors.success,
                fontWeight: FontWeight.w600,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _scannerBox() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(AppSizes.radiusLg),
          child: MobileScanner(
            controller: _controller,
            onDetect: _onDetect,
          ),
        ),
        Positioned.fill(
          child: CustomPaint(painter: _ScannerBracketsPainter()),
        ),
        const Center(
          child: Text(
            'QR CODE SCANNER',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 12,
              letterSpacing: 3,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

class _ScannerBracketsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const len = 40.0;
    final paint = Paint()
      ..color = AppColors.accent
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(const Offset(0, 0), const Offset(len, 0), paint);
    canvas.drawLine(const Offset(0, 0), const Offset(0, len), paint);
    canvas.drawLine(Offset(size.width, 0), Offset(size.width - len, 0), paint);
    canvas.drawLine(Offset(size.width, 0), Offset(size.width, len), paint);
    canvas.drawLine(Offset(0, size.height), Offset(len, size.height), paint);
    canvas.drawLine(Offset(0, size.height), Offset(0, size.height - len), paint);
    canvas.drawLine(
        Offset(size.width, size.height),
        Offset(size.width - len, size.height),
        paint);
    canvas.drawLine(
        Offset(size.width, size.height),
        Offset(size.width, size.height - len),
        paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}