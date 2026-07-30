import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/extensions.dart';

/// Input/Form Theme Configuration
abstract class AppInputTheme {
  AppInputTheme._();

  /// Text field decoration theme
  static InputDecorationTheme inputDecorationTheme({bool isDark = false}) {
    final fillColor = isDark ? AppColors.surface : AppColors.scaffoldBackgroundLight;
    final hintColor = isDark
        ? AppColors.onSurfaceVariant.withValues(alpha: 0.6)
        : AppColors.textHint;
    final borderColor = isDark ? AppColors.neutralVariant : AppColors.outline;

    return InputDecorationTheme(
      filled: true,
      fillColor: fillColor,
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      hintStyle: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: hintColor,
      ),
      labelStyle: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: isDark ? AppColors.onSurfaceVariant : AppColors.textSecondary,
      ),
      floatingLabelStyle: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: isDark ? AppColors.tertiaryLight : AppColors.primary,
      ),
      errorStyle: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.error,
      ),
      helperStyle: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
      ),
      prefixStyle: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.textPrimary,
      ),
      suffixStyle: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.textPrimary,
      ),
      counterStyle: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
      ),
      prefixIconColor: isDark ? AppColors.onSurfaceVariant : AppColors.textSecondary,
      suffixIconColor: isDark ? AppColors.onSurfaceVariant : AppColors.textSecondary,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: borderColor, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(color: borderColor, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(
          color: isDark ? AppColors.tertiary : AppColors.primary,
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: const BorderSide(color: AppColors.error, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: const BorderSide(color: AppColors.error, width: 2),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.r),
        borderSide: BorderSide(
          color: borderColor.withValues(alpha: 0.38),
          width: 1,
        ),
      ),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      isDense: false,
      alignLabelWithHint: true,
    );
  }

  /// Checkbox theme
  static CheckboxThemeData checkboxTheme({bool isDark = false}) {
    return CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primary;
        }
        if (states.contains(WidgetState.disabled)) {
          return AppColors.outline.withValues(alpha: 0.38);
        }
        return Colors.transparent;
      }),
      checkColor: WidgetStateProperty.all(AppColors.onPrimary),
      overlayColor: WidgetStateProperty.all(
        AppColors.primary.withValues(alpha: 0.12),
      ),
      splashRadius: 20.r,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
      side: const BorderSide(color: AppColors.outline, width: 2),
      visualDensity: VisualDensity.standard,
    );
  }

  /// Switch theme
  static SwitchThemeData switchTheme({bool isDark = false}) {
    return SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.onPrimary;
        }
        return AppColors.textSecondary;
      }),
      trackColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primary;
        }
        return AppColors.outline;
      }),
      trackOutlineColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.transparent;
        }
        return AppColors.outline;
      }),
      overlayColor: WidgetStateProperty.all(
        AppColors.primary.withValues(alpha: 0.12),
      ),
      splashRadius: 20.r,
    );
  }

  /// Radio button theme
  static RadioThemeData radioTheme({bool isDark = false}) {
    return RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith<Color>((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primary;
        }
        if (states.contains(WidgetState.disabled)) {
          return AppColors.outline.withValues(alpha: 0.38);
        }
        return AppColors.outline;
      }),
      overlayColor: WidgetStateProperty.all(
        AppColors.primary.withValues(alpha: 0.12),
      ),
      splashRadius: 20.r,
      visualDensity: VisualDensity.standard,
    );
  }

  /// Slider theme
  static SliderThemeData sliderTheme({bool isDark = false}) {
    return SliderThemeData(
      activeTrackColor: AppColors.primary,
      inactiveTrackColor: AppColors.outline,
      thumbColor: AppColors.primary,
      overlayColor: AppColors.primary.withValues(alpha: 0.12),
      valueIndicatorColor: AppColors.primary,
      valueIndicatorTextStyle: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.onPrimary,
      ),
      trackHeight: 4.h,
      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.r),
      overlayShape: RoundSliderOverlayShape(overlayRadius: 20.r),
      tickMarkShape: const RoundSliderTickMarkShape(),
      activeTickMarkColor: AppColors.onPrimary,
      inactiveTickMarkColor: AppColors.textSecondary,
      valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
      showValueIndicator: ShowValueIndicator.onDrag,
    );
  }

  /// Progress indicator theme
  static ProgressIndicatorThemeData progressIndicatorTheme({
    bool isDark = false,
  }) {
    return ProgressIndicatorThemeData(
      color: AppColors.primary,
      circularTrackColor: AppColors.outline,
      linearTrackColor: AppColors.outline,
      refreshBackgroundColor: isDark ? AppColors.surface : Colors.white,
    );
  }

  /// Search bar theme
  static SearchBarThemeData searchBarTheme({bool isDark = false}) {
    final bgColor = isDark ? AppColors.surface : AppColors.scaffoldBackgroundLight;
    return SearchBarThemeData(
      elevation: WidgetStateProperty.all(0),
      backgroundColor: WidgetStateProperty.all(bgColor),
      padding: WidgetStateProperty.all(
        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
          side: BorderSide(
            color: isDark ? AppColors.neutralVariant : AppColors.outline,
          ),
        ),
      ),
      hintStyle: WidgetStateProperty.all(
        TextStyle(
          color: isDark
              ? AppColors.onSurfaceVariant.withValues(alpha: 0.6)
              : AppColors.textHint,
          fontSize: 14.sp,
        ),
      ),
    );
  }

  /// Dropdown menu theme
  static DropdownMenuThemeData dropdownMenuTheme({bool isDark = false}) {
    return DropdownMenuThemeData(
      menuStyle: MenuStyle(
        backgroundColor: WidgetStateProperty.all(
          isDark ? AppColors.surface : Colors.white,
        ),
        elevation: WidgetStateProperty.all(4),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
      ),
      inputDecorationTheme: inputDecorationTheme(isDark: isDark),
    );
  }
}
