import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/value/dimension.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacing.h(16),
        // Logo
        Center(
          child: Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Center(
              child: Image.asset(
                'assets/images/app_logo.png', // Assuming logo is app_logo.png
                height: 48,
                width: 48,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.image_not_supported,
                  size: 40,
                ),
              ),
            ),
          ),
        ),
        Spacing.h(32),
        // Welcome Text
        const Text(
          'Welcome back.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w800,
            color: AppColors.primary,
            fontFamily: 'serif',
          ),
        ),
        Spacing.h(12),
        const Text(
          'Log in to keep learning where you left off.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.neutral,
          ),
        ),
      ],
    );
  }
}
