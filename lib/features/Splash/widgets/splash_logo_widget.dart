import 'package:flutter/material.dart';
import '../../../core/constants/app_constant.dart';
import '../../../core/utils/extensions.dart';

/// Logo Widget for Aurify Marketing Splash Screen using app_logo.png
class SplashLogoWidget extends StatelessWidget {
  final double size;

  const SplashLogoWidget({super.key, this.size = 140});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.w,
      height: size.w,
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 20.r,
            offset: Offset(0, 8.h),
          ),
        ],
      ),
      child: Center(
        child: Image.asset(
          AppConstants.appLogo,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
