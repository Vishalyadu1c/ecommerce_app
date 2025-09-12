
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextThemes {

  TextThemes._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: TextStyle().copyWith(fontSize: 30.sp, fontWeight: FontWeight.bold, color: Colors.black),
    headlineMedium: TextStyle().copyWith(fontSize: 22.sp, fontWeight: FontWeight.w600, color: Colors.black87),
    headlineSmall: TextStyle().copyWith(fontSize: 18.sp, fontWeight: FontWeight.w500, color: Colors.black54),

    titleLarge: TextStyle().copyWith(fontSize: 16.sp, fontWeight: FontWeight.w500, color: Colors.black),
    titleMedium: TextStyle().copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.black87),
    titleSmall: TextStyle().copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.black54),

    bodyLarge: TextStyle().copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.black),
    bodyMedium: TextStyle().copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.black87),
    bodySmall: TextStyle().copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.black54),

    labelLarge: TextStyle().copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500, color: Colors.black),
    labelMedium: TextStyle().copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500, color: Colors.black87),
    labelSmall: TextStyle().copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500, color: Colors.black54),
  );


  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: TextStyle().copyWith(fontSize: 30.sp, fontWeight: FontWeight.bold, color: Colors.white),
    headlineMedium: TextStyle().copyWith(fontSize: 22.sp, fontWeight: FontWeight.w600, color: Colors.white70),
    headlineSmall: TextStyle().copyWith(fontSize: 18.sp, fontWeight: FontWeight.w500, color: Colors.white54),

    titleLarge: TextStyle().copyWith(fontSize: 16.sp, fontWeight: FontWeight.w500, color: Colors.white),
    titleMedium: TextStyle().copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.white70),
    titleSmall: TextStyle().copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.white54),

    bodyLarge: TextStyle().copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.white),
    bodyMedium: TextStyle().copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.white70),
    bodySmall: TextStyle().copyWith(fontSize: 14.sp, fontWeight: FontWeight.w400, color: Colors.white54),

    labelLarge: TextStyle().copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500, color: Colors.white),
    labelMedium: TextStyle().copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500, color: Colors.white70),
    labelSmall: TextStyle().copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500, color: Colors.white54),
  );

}