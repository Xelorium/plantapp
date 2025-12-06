import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract final class AppTextStyles {
  // Headings
  static TextStyle h1(BuildContext context) => Theme.of(context).textTheme.displayLarge!;

  static TextStyle h2(BuildContext context) => Theme.of(context).textTheme.displayMedium!;

  static TextStyle h3(BuildContext context) => Theme.of(context).textTheme.headlineMedium!;

  // Body
  static TextStyle bodyLarge(BuildContext context) => Theme.of(context).textTheme.bodyLarge!;

  static TextStyle bodyMedium(BuildContext context) => Theme.of(context).textTheme.bodyMedium!;

  static TextStyle bodySmall(BuildContext context) => Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 12.sp);
  
  // Specific UI Elements
  static TextStyle button(BuildContext context) => Theme.of(context).textTheme.labelLarge!;

  static TextStyle sectionTitle(BuildContext context) => Theme.of(context).textTheme.bodyLarge!.copyWith(
        fontSize: 15.sp,
        fontWeight: FontWeight.w600,
      );
}
