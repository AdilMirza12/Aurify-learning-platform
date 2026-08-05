import 'package:flutter/material.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/value/dimension.dart';

class RegisterHeaderWidget extends StatelessWidget {
  const RegisterHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacing.h(16),
        const Text(
          'Create your account.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w800,
            color: AppColors.primary,
            fontFamily: 'serif',
          ),
        ),
        Spacing.h(10),
        const Text(
          'Start free — no credit card required.',
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
