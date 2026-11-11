import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_sizes.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final IconData? trailingIcon;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    final disabled = onPressed == null || isLoading;

    return Container(
      height: AppSizes.buttonHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.radiusPill),
        gradient: disabled
            ? null
            : const LinearGradient(
                colors: [AppColors.primary, AppColors.primaryDark],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
        color: disabled ? AppColors.border : null,
        boxShadow: disabled
            ? null
            : [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.30),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: disabled ? null : onPressed,
          borderRadius: BorderRadius.circular(AppSizes.radiusPill),
          child: Center(
            child: isLoading
                ? const SizedBox(
                    height: 22,
                    width: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      color: Colors.white,
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        label,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.3,
                        ),
                      ),
                      if (trailingIcon != null) ...[
                        const SizedBox(width: 8),
                        Icon(trailingIcon, color: Colors.white, size: 18),
                      ],
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}