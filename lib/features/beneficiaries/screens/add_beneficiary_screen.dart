import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/utils/qr_generator.dart';
import '../../../data/models/beneficiary.dart';
import '../../../data/repositories/beneficiary_repo.dart';

class AddBeneficiaryScreen extends ConsumerStatefulWidget {
  final BeneficiaryType? presetType;
  const AddBeneficiaryScreen({super.key, this.presetType});

  @override
  ConsumerState<AddBeneficiaryScreen> createState() =>
      _AddBeneficiaryScreenState();
}

class _AddBeneficiaryScreenState extends ConsumerState<AddBeneficiaryScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _guardianCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _aadhaarCtrl = TextEditingController();

  late BeneficiaryType _type;
  Gender _gender = Gender.female;
  DateTime _dob = DateTime.now();
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    _type = widget.presetType ?? BeneficiaryType.child0to6m;
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _guardianCtrl.dispose();
    _phoneCtrl.dispose();
    _aadhaarCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickDob() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _dob,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null) setState(() => _dob = picked);
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _saving = true);

    final b = Beneficiary()
      ..qrCode = QrGenerator.generate(_type)
      ..type = _type
      ..name = _nameCtrl.text.trim()
      ..gender = _gender
      ..dateOfBirth = _dob
      ..guardianName = _guardianCtrl.text.trim().isEmpty
          ? null
          : _guardianCtrl.text.trim()
      ..phoneNumber = _phoneCtrl.text.trim().isEmpty
          ? null
          : _phoneCtrl.text.trim()
      ..aadhaarNumber = _aadhaarCtrl.text.trim().isEmpty
          ? null
          : _aadhaarCtrl.text.trim();

    await ref.read(beneficiaryRepoProvider).add(b);

    if (mounted) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Add Beneficiary'),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSizes.screenPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _label('Full Name'),
                TextFormField(
                  controller: _nameCtrl,
                  decoration: const InputDecoration(hintText: 'Enter name'),
                  validator: (v) =>
                      v == null || v.trim().isEmpty ? 'Required' : null,
                ),
                const SizedBox(height: AppSizes.md),

                _label('Beneficiary Type'),
                DropdownButtonFormField<BeneficiaryType>(
                  initialValue: _type,
                  decoration: const InputDecoration(),
                  items: BeneficiaryType.values
                      .map((t) => DropdownMenuItem(
                            value: t,
                            child: Text(_typeLabel(t)),
                          ))
                      .toList(),
                  onChanged: (v) => setState(() => _type = v!),
                ),
                const SizedBox(height: AppSizes.md),

                _label('Gender'),
                Row(
                  children: Gender.values.map((g) {
                    final selected = g == _gender;
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: GestureDetector(
                          onTap: () => setState(() => _gender = g),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            decoration: BoxDecoration(
                              color: selected
                                  ? AppColors.primary
                                  : Colors.white,
                              borderRadius:
                                  BorderRadius.circular(AppSizes.radiusMd),
                              border: Border.all(
                                color: selected
                                    ? AppColors.primary
                                    : AppColors.border,
                              ),
                            ),
                            child: Text(
                              g.name[0].toUpperCase() + g.name.substring(1),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: selected
                                    ? Colors.white
                                    : AppColors.textPrimary,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: AppSizes.md),

                _label('Date of Birth'),
                GestureDetector(
                  onTap: _pickDob,
                  child: Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: AppColors.surfaceAlt,
                      borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.calendar_today_rounded,
                            size: 18, color: AppColors.textHint),
                        const SizedBox(width: 12),
                        Text(
                          '${_dob.day}/${_dob.month}/${_dob.year}',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: AppSizes.md),

                _label('Guardian Name (optional)'),
                TextFormField(
                  controller: _guardianCtrl,
                  decoration:
                      const InputDecoration(hintText: 'Father / Husband'),
                ),
                const SizedBox(height: AppSizes.md),

                _label('Phone (optional)'),
                TextFormField(
                  controller: _phoneCtrl,
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    hintText: '10-digit mobile',
                    counterText: '',
                  ),
                ),
                const SizedBox(height: AppSizes.md),

                _label('Aadhaar (optional)'),
                TextFormField(
                  controller: _aadhaarCtrl,
                  keyboardType: TextInputType.number,
                  maxLength: 12,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    hintText: '12-digit Aadhaar',
                    counterText: '',
                  ),
                ),
                const SizedBox(height: AppSizes.xl),

                ElevatedButton(
                  onPressed: _saving ? null : _save,
                  child: _saving
                      ? const SizedBox(
                          height: 22,
                          width: 22,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.5,
                            color: Colors.white,
                          ),
                        )
                      : const Text('Save Beneficiary'),
                ),
                const SizedBox(height: AppSizes.lg),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _label(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: AppColors.textSecondary,
          ),
        ),
      );

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