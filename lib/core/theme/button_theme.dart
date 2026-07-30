import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/extensions.dart';

/// Button Theme Configuration
abstract class AppButtonTheme {
  AppButtonTheme._();

  /// Primary elevated button style
  static ElevatedButtonThemeData elevatedButtonTheme({bool isDark = false}) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
        disabledBackgroundColor: isDark
            ? AppColors.neutralDark.withValues(alpha: 0.4)
            : AppColors.primary.withValues(alpha: 0.38),
        disabledForegroundColor: isDark
            ? AppColors.onSurface.withValues(alpha: 0.38)
            : AppColors.onPrimary.withValues(alpha: 0.38),
        elevation: 2,
        shadowColor: AppColors.primary.withValues(alpha: 0.4),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
        minimumSize: Size(64.w, 48.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        textStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  /// Text button style
  static TextButtonThemeData textButtonTheme({bool isDark = false}) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: isDark ? AppColors.tertiaryLight : AppColors.primary,
        disabledForegroundColor: AppColors.primary.withValues(alpha: 0.38),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        minimumSize: Size(48.w, 40.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        textStyle: TextStyle(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.25,
        ),
      ),
    );
  }

  /// Outlined button style
  static OutlinedButtonThemeData outlinedButtonTheme({bool isDark = false}) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: isDark ? AppColors.onSurface : AppColors.primary,
        disabledForegroundColor: AppColors.primary.withValues(alpha: 0.38),
        side: BorderSide(
          color: isDark ? AppColors.neutralVariant : AppColors.primary,
          width: 1.5,
        ),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
        minimumSize: Size(64.w, 48.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        textStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  /// Icon button style
  static IconButtonThemeData iconButtonTheme({bool isDark = false}) {
    return IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: isDark ? AppColors.onSurface : AppColors.textPrimary,
        disabledForegroundColor: AppColors.textDisabled,
        highlightColor: AppColors.primary.withValues(alpha: 0.1),
        padding: EdgeInsets.all(8.w),
        minimumSize: Size(40.w, 40.h),
        iconSize: 24.w,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
    );
  }

  /// Floating Action Button style
  static FloatingActionButtonThemeData fabTheme({
    bool isDark = false,
  }) {
    return FloatingActionButtonThemeData(
      backgroundColor: isDark ? AppColors.secondary : AppColors.primary,
      foregroundColor: AppColors.onPrimary,
      elevation: 6,
      focusElevation: 8,
      hoverElevation: 8,
      highlightElevation: 12,
      disabledElevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      sizeConstraints: BoxConstraints.tightFor(width: 56.w, height: 56.h),
      smallSizeConstraints: BoxConstraints.tightFor(width: 40.w, height: 40.h),
      largeSizeConstraints: BoxConstraints.tightFor(width: 96.w, height: 96.h),
      extendedPadding: EdgeInsets.symmetric(horizontal: 20.w),
    );
  }

  /// Filled button style
  static FilledButtonThemeData filledButtonTheme({bool isDark = false}) {
    return FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
        disabledBackgroundColor: AppColors.primary.withValues(alpha: 0.12),
        disabledForegroundColor: AppColors.onPrimary.withValues(alpha: 0.38),
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 14.h),
        minimumSize: Size(64.w, 48.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        textStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
