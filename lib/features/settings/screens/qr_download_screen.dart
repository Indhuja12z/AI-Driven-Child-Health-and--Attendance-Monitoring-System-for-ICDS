import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../data/local/isar_service.dart';
import '../../../data/models/beneficiary.dart';

class QrDownloadScreen extends ConsumerStatefulWidget {
  final int beneficiaryId;
  const QrDownloadScreen({super.key, required this.beneficiaryId});

  @override
  ConsumerState<QrDownloadScreen> createState() => _QrDownloadScreenState();
}

class _QrDownloadScreenState extends ConsumerState<QrDownloadScreen> {
  Beneficiary? b;
  bool loading = true;
  final _qrKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final data = await isarService.isar.beneficiaries.get(widget.beneficiaryId);
    if (mounted) {
      setState(() {
        b = data;
        loading = false;
      });
    }
  }

  Future<void> _downloadQr() async {
    try {
      final boundary =
          _qrKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      final image = await boundary.toImage(pixelRatio: 4.0);
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData == null) return;

      final bytes = byteData.buffer.asUint8List();
      final dir = await getApplicationDocumentsDirectory();
      final fileName = 'QR_${b!.name.replaceAll(' ', '_')}_${b!.id}.png';
      final file = File('${dir.path}/$fileName');
      await file.writeAsBytes(bytes);

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Saved: $fileName'),
          backgroundColor: AppColors.success,
          behavior: SnackBarBehavior.floating,
        ),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed: $e'),
          backgroundColor: AppColors.danger,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (b == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('QR Code')),
        body: const Center(child: Text('Beneficiary not found')),
      );
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('QR Code')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.lg),
          child: Column(
            children: [
              const SizedBox(height: AppSizes.md),

              // Name
              Text(
                b!.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                _typeLabel(b!.type),
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.textHint,
                ),
              ),
              const SizedBox(height: AppSizes.xl),

              // QR card
              RepaintBoundary(
                key: _qrKey,
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(AppSizes.radiusLg),
                    border: Border.all(color: AppColors.border),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.06),
                        blurRadius: 24,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      QrImageView(
                        data: b!.qrCode,
                        version: QrVersions.auto,
                        size: 240,
                        backgroundColor: Colors.white,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        b!.qrCode,
                        style: const TextStyle(
                          fontSize: 11,
                          letterSpacing: 1.2,
                          color: AppColors.textHint,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'Little Steps Tracker',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: AppSizes.xl),

              // Download button
              ElevatedButton.icon(
                onPressed: _downloadQr,
                icon: const Icon(Icons.download_rounded),
                label: const Text('Download QR'),
              ),
              const SizedBox(height: AppSizes.md),
              const Text(
                'Saved to app documents folder',
                style: TextStyle(fontSize: 12, color: AppColors.textHint),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _typeLabel(BeneficiaryType t) {
    switch (t) {
      case BeneficiaryType.child0to6m:
        return 'Child (0–6 months)';
      case BeneficiaryType.child6mTo3y:
        return 'Child (6m–3y)';
      case BeneficiaryType.child3to6y:
        return 'Child (3–6y)';
      case BeneficiaryType.pregnant:
        return 'Pregnant Woman';
      case BeneficiaryType.lactating:
        return 'Lactating Mother';
      case BeneficiaryType.adolescent:
        return 'Adolescent Girl';
    }
  }
}