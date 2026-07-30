import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/extensions.dart';

/// Defines component-specific themes for the application.
abstract class AppComponentTheme {
  AppComponentTheme._();

  /// AppBar Theme
  static AppBarTheme appBarTheme({bool isDark = false}) {
    return AppBarTheme(
      //backgroundColor: isDark ? AppColors.scaffoldBackgroundDark : AppColors.primary,
      foregroundColor: AppColors.onPrimary,
      elevation: 0,
      scrolledUnderElevation: 2,
      centerTitle: true,
      iconTheme: const IconThemeData(color: AppColors.onPrimary),
      actionsIconTheme: const IconThemeData(color: AppColors.onPrimary),
      titleTextStyle: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.onPrimary,
        letterSpacing: 0.15,
      ),
    );
  }

  /// Card Theme Data
  static CardThemeData cardTheme({bool isDark = false}) {
    return CardThemeData(
      color: isDark ? AppColors.surface : Colors.white,
      elevation: isDark ? 1 : 2,
      shadowColor: Colors.black.withValues(alpha: 0.1),
      margin: EdgeInsets.all(8.r),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
        side: isDark
            ? BorderSide(color: AppColors.neutralVariant.withValues(alpha: 0.5))
            : BorderSide.none,
      ),
    );
  }

  /// Dialog Theme Data
  static DialogThemeData dialogTheme({bool isDark = false}) {
    return DialogThemeData(
      backgroundColor: isDark ? AppColors.surface : Colors.white,
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      titleTextStyle: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.bold,
        color: isDark ? AppColors.onSurface : AppColors.primary,
      ),
      contentTextStyle: TextStyle(
        fontSize: 14.sp,
        color: isDark ? AppColors.onSurfaceVariant : AppColors.neutralDark,
      ),
    );
  }

  /// BottomSheet Theme
  static BottomSheetThemeData bottomSheetTheme({bool isDark = false}) {
    return BottomSheetThemeData(
      backgroundColor: isDark ? AppColors.surface : Colors.white,
      modalBackgroundColor: isDark ? AppColors.surface : Colors.white,
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      dragHandleColor: isDark
          ? AppColors.neutralVariant
          : AppColors.neutralLight,
      dragHandleSize: Size(32.w, 4.h),
      showDragHandle: true,
    );
  }

  /// SnackBar Theme
  static SnackBarThemeData snackBarTheme({bool isDark = false}) {
    return SnackBarThemeData(
      backgroundColor: isDark ? AppColors.surfaceLight : AppColors.primaryDark,
      contentTextStyle: TextStyle(color: AppColors.onPrimary, fontSize: 14.sp),
      actionTextColor: AppColors.tertiaryLight,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      elevation: 4,
    );
  }

  /// Chip Theme
  static ChipThemeData chipTheme({bool isDark = false}) {
    return ChipThemeData(
      backgroundColor: isDark
          ? AppColors.surface
          : AppColors.scaffoldBackgroundLight,
      disabledColor: isDark ? AppColors.neutralDark : AppColors.neutralLight,
      selectedColor: AppColors.primaryContainer,
      secondarySelectedColor: AppColors.secondaryContainer,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      labelStyle: TextStyle(
        fontSize: 12.sp,
        color: isDark ? AppColors.onSurface : AppColors.primary,
        fontWeight: FontWeight.w500,
      ),
      secondaryLabelStyle: TextStyle(
        fontSize: 12.sp,
        color: AppColors.onSecondaryContainer,
        fontWeight: FontWeight.w500,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
        side: BorderSide(
          color: isDark ? AppColors.neutralVariant : AppColors.neutralLight,
        ),
      ),
    );
  }

  /// Checkbox Theme
  static CheckboxThemeData checkboxTheme({bool isDark = false}) {
    return CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.secondary;
        }
        return Colors.transparent;
      }),
      checkColor: WidgetStateProperty.all(AppColors.onSecondary),
      side: BorderSide(
        color: isDark ? AppColors.neutralLight : AppColors.neutral,
        width: 2,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
    );
  }

  /// Radio Theme
  static RadioThemeData radioTheme({bool isDark = false}) {
    return RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.secondary;
        }
        return isDark ? AppColors.neutralLight : AppColors.neutral;
      }),
    );
  }

  /// Switch Theme
  static SwitchThemeData switchTheme({bool isDark = false}) {
    return SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.onSecondary;
        }
        return isDark ? AppColors.neutralLight : AppColors.neutralDark;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.secondary;
        }
        return isDark
            ? AppColors.neutralDark.withValues(alpha: 0.5)
            : AppColors.neutralLight.withValues(alpha: 0.5);
      }),
    );
  }

  /// Divider Theme
  static DividerThemeData dividerTheme({bool isDark = false}) {
    return DividerThemeData(
      color: isDark
          ? AppColors.neutralVariant.withValues(alpha: 0.5)
          : AppColors.neutralLight.withValues(alpha: 0.5),
      thickness: 1,
      space: 16.h,
    );
  }

  /// TabBar Theme Data
  static TabBarThemeData tabBarTheme({bool isDark = false}) {
    return TabBarThemeData(
      indicatorColor: AppColors.secondary,
      labelColor: isDark ? AppColors.onSurface : AppColors.onPrimary,
      unselectedLabelColor: isDark
          ? AppColors.onSurfaceVariant.withValues(alpha: 0.7)
          : AppColors.onPrimary.withValues(alpha: 0.7),
      labelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
      unselectedLabelStyle: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      indicatorSize: TabBarIndicatorSize.tab,
    );
  }

  /// BottomNavigationBar Theme
  static BottomNavigationBarThemeData bottomNavigationBarTheme({
    bool isDark = false,
  }) {
    return BottomNavigationBarThemeData(
      backgroundColor: isDark ? AppColors.surface : Colors.white,
      selectedItemColor: AppColors.secondary,
      unselectedItemColor: isDark
          ? AppColors.onSurfaceVariant.withValues(alpha: 0.6)
          : AppColors.neutral,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
      selectedLabelStyle: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  /// NavigationBar Theme (M3)
  static NavigationBarThemeData navigationBarTheme({bool isDark = false}) {
    return NavigationBarThemeData(
      backgroundColor: isDark ? AppColors.surface : Colors.white,
      indicatorColor: AppColors.secondaryContainer,
      elevation: 3,
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: isDark ? AppColors.onSurface : AppColors.primary,
          );
        }
        return TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: isDark ? AppColors.onSurfaceVariant : AppColors.neutral,
        );
      }),
    );
  }

  /// Drawer Theme
  static DrawerThemeData drawerTheme({bool isDark = false}) {
    return DrawerThemeData(
      // backgroundColor: isDark ? AppColors.scaffoldBackgroundDark : Colors.white,
      // elevation: 16,
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.horizontal(right: Radius.circular(20.r)),
      // ),
    );
  }

  /// Tooltip Theme
  static TooltipThemeData tooltipTheme({bool isDark = false}) {
    return TooltipThemeData(
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceLight : AppColors.primaryDark,
        borderRadius: BorderRadius.circular(8.r),
      ),
      textStyle: TextStyle(color: AppColors.onPrimary, fontSize: 12.sp),
    );
  }

  /// ProgressIndicator Theme
  static ProgressIndicatorThemeData progressIndicatorTheme({
    bool isDark = false,
  }) {
    return ProgressIndicatorThemeData(
      color: AppColors.secondary,
      linearTrackColor: isDark
          ? AppColors.surface
          : AppColors.scaffoldBackgroundLight,
      circularTrackColor: isDark
          ? AppColors.surface
          : AppColors.scaffoldBackgroundLight,
    );
  }

  /// Badge Theme
  static BadgeThemeData badgeTheme({bool isDark = false}) {
    return BadgeThemeData(
      backgroundColor: AppColors.secondary,
      textColor: AppColors.onSecondary,
      textStyle: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.bold),
    );
  }

  /// ListTile Theme
  static ListTileThemeData listTileTheme({bool isDark = false}) {
    return ListTileThemeData(
      tileColor: Colors.transparent,
      selectedTileColor: isDark
          ? AppColors.primaryContainer.withValues(alpha: 0.3)
          : AppColors.primaryContainer.withValues(alpha: 0.1),
      iconColor: isDark ? AppColors.onSurfaceVariant : AppColors.neutral,
      textColor: isDark ? AppColors.onSurface : AppColors.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
    );
  }

  /// Icon Theme
  static IconThemeData iconTheme({bool isDark = false}) {
    return IconThemeData(
      color: isDark ? AppColors.onSurface : AppColors.primary,
      size: 24.w,
    );
  }

  /// Primary Icon Theme
  static IconThemeData primaryIconTheme({bool isDark = false}) {
    return IconThemeData(color: AppColors.onPrimary, size: 24.w);
  }

  /// PopupMenu Theme
  static PopupMenuThemeData popupMenuTheme({bool isDark = false}) {
    return PopupMenuThemeData(
      color: isDark ? AppColors.surface : Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      textStyle: TextStyle(
        color: isDark ? AppColors.onSurface : AppColors.primary,
        fontSize: 14.sp,
      ),
    );
  }

  /// ExpansionTile Theme
  static ExpansionTileThemeData expansionTileTheme({bool isDark = false}) {
    return ExpansionTileThemeData(
      backgroundColor: Colors.transparent,
      collapsedBackgroundColor: Colors.transparent,
      iconColor: isDark ? AppColors.onSurface : AppColors.primary,
      collapsedIconColor: isDark
          ? AppColors.onSurfaceVariant
          : AppColors.neutral,
      textColor: isDark ? AppColors.onSurface : AppColors.primary,
      collapsedTextColor: isDark
          ? AppColors.onSurfaceVariant
          : AppColors.neutral,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
    );
  }

  /// Scrollbar Theme
  static ScrollbarThemeData scrollbarTheme({bool isDark = false}) {
    return ScrollbarThemeData(
      thumbColor: WidgetStateProperty.all(
        isDark
            ? AppColors.neutralLight.withValues(alpha: 0.5)
            : AppColors.neutral.withValues(alpha: 0.5),
      ),
      radius: Radius.circular(8.r),
      thickness: WidgetStateProperty.all(6.w),
    );
  }
}
