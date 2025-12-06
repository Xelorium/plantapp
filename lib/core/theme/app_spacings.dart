import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract final class AppSpacings {
  // Page Paddings
  static EdgeInsets get pagePadding => EdgeInsets.symmetric(horizontal: 24.w);
  static EdgeInsets get pagePaddingHorizontal => EdgeInsets.symmetric(horizontal: 24.w);
  static EdgeInsets get pagePaddingVertical => EdgeInsets.symmetric(vertical: 16.h);
  static EdgeInsets get pagePaddingAll => EdgeInsets.all(24.w);

  // Card Paddings
  static EdgeInsets get cardPadding => EdgeInsets.all(16.w);
  static EdgeInsets get cardPaddingSmall => EdgeInsets.all(12.w);

  // Item Spacings (Gap between items)
  static double get s4 => 4.w;
  static double get s8 => 8.w;
  static double get s12 => 12.w;
  static double get s16 => 16.w;
  static double get s24 => 24.w;
  static double get s32 => 32.w;
  static double get s48 => 48.w;
  
  // Specific UI Element Dimensions
  static double get buttonHeight => 56.h;
  static double get radius => 12.r;
}
