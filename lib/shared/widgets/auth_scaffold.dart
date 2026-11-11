import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

/// Shared background scaffold for all auth screens.
/// Renders a soft vertical gradient + two decorative blurred circles.
class AuthScaffold extends StatelessWidget {
  final Widget child;
  const AuthScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Soft gradient background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFF0F6FF), // very light blue
                  Color(0xFFF8F9FA),
                  Color(0xFFFFFFFF),
                ],
                stops: [0.0, 0.45, 1.0],
              ),
            ),
          ),

          // Decorative top-right circle
          Positioned(
            top: -80,
            right: -80,
            child: Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary.withValues(alpha: 0.06),
              ),
            ),
          ),

          // Decorative bottom-left circle
          Positioned(
            bottom: -100,
            left: -100,
            child: Container(
              width: 260,
              height: 260,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.accent.withValues(alpha: 0.05),
              ),
            ),
          ),

          // Content
          SafeArea(child: child),
        ],
      ),
    );
  }
}