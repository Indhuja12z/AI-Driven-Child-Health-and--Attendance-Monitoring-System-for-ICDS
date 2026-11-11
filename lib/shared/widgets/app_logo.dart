import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class AppLogo extends StatelessWidget {
  final double size;
  const AppLogo({super.key, this.size = 110});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          // Outer glow
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.18),
            blurRadius: 32,
            spreadRadius: 4,
          ),
          // Inner shadow
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.10),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.15),
          width: 1.5,
        ),
      ),
      child: ClipOval(
        child: Padding(
          padding: EdgeInsets.all(size * 0.16),
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}