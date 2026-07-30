import 'package:flutter/material.dart';
import '../utils/extensions.dart';

/// Reusable Padding definitions supporting responsive scaling
abstract class AppPaddings {
  AppPaddings._();

  static EdgeInsets all(double value) => EdgeInsets.all(value.r);

  static EdgeInsets symmetric({double h = 0, double v = 0}) =>
      EdgeInsets.symmetric(horizontal: h.w, vertical: v.h);

  static EdgeInsets only({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) =>
      EdgeInsets.only(
        left: left.w,
        top: top.h,
        right: right.w,
        bottom: bottom.h,
      );
}

/// Reusable Margin definitions supporting responsive scaling
abstract class AppMargin {
  AppMargin._();

  static EdgeInsets all(double value) => EdgeInsets.all(value.r);

  static EdgeInsets symmetric({double h = 0, double v = 0}) =>
      EdgeInsets.symmetric(horizontal: h.w, vertical: v.h);

  static EdgeInsets only({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) =>
      EdgeInsets.only(
        left: left.w,
        top: top.h,
        right: right.w,
        bottom: bottom.h,
      );
}

/// Reusable BorderRadius definitions supporting responsive scaling
abstract class AppRadius {
  AppRadius._();

  static BorderRadius all(double radius) => BorderRadius.circular(radius.r);

  static BorderRadius circular(double radius) => BorderRadius.circular(radius.r);

  static BorderRadius top(double radius) =>
      BorderRadius.vertical(top: Radius.circular(radius.r));

  static BorderRadius bottom(double radius) =>
      BorderRadius.vertical(bottom: Radius.circular(radius.r));

  static BorderRadius only({
    double topLeft = 0,
    double topRight = 0,
    double bottomLeft = 0,
    double bottomRight = 0,
  }) =>
      BorderRadius.only(
        topLeft: Radius.circular(topLeft.r),
        topRight: Radius.circular(topRight.r),
        bottomLeft: Radius.circular(bottomLeft.r),
        bottomRight: Radius.circular(bottomRight.r),
      );
}

/// Reusable Spacing (SizedBox) helpers supporting responsive scaling
abstract class Spacing {
  Spacing._();

  static SizedBox h(double height) => SizedBox(height: height.h);

  static SizedBox w(double width) => SizedBox(width: width.w);

  static SizedBox get empty => const SizedBox.shrink();
}
