import 'package:ecommerce_app/app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldThemes {
  TextFieldThemes._();

  static InputDecorationTheme lightThemeInputDecoration = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,

    filled: true,
    fillColor: AppColors.lightGreyColour,

    labelStyle: TextStyle().copyWith(fontSize: 14.sp,color: Colors.black),
    hintStyle: TextStyle().copyWith(fontSize: 14.sp,color: Colors.grey),
    errorStyle: TextStyle().copyWith(fontStyle: FontStyle.normal),

    

    border: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.all(Radius.circular(4.sp)),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.all(Radius.circular(4).r),
      borderSide: BorderSide(color: Colors.black12, width: 0.8),
    ),
    enabledBorder: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.all(Radius.circular(4).r),
      borderSide: BorderSide.none,
    ),
    errorBorder: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.all(Radius.circular(4).r),
      borderSide: BorderSide(color: Colors.red, width: 0.8),
    ),
    focusedErrorBorder: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.all(Radius.circular(4).r),
      borderSide: BorderSide(color: Colors.red, width: 0.8),
    ),
  );

  static InputDecorationTheme darkThemeInputDecoration = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,

    filled: true,
    fillColor: AppColors.darkThemeSecondaryColour,

    labelStyle: TextStyle().copyWith(fontSize: 14.sp,color: Colors.white),
    hintStyle: TextStyle().copyWith(fontSize: 14.sp,color: Colors.grey),
    errorStyle: TextStyle().copyWith(fontStyle: FontStyle.normal),

    border: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.all(Radius.circular(4).r),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.all(Radius.circular(4).r),
      borderSide: BorderSide(color: Colors.white12, width: 0.8),
    ),
    enabledBorder: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.all(Radius.circular(4).r),
      borderSide: BorderSide.none,
    ),
    errorBorder: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.all(Radius.circular(4).r),
      borderSide: BorderSide(color: Colors.red, width: 0.8),
    ),
    focusedErrorBorder: OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.all(Radius.circular(4).r),
      borderSide: BorderSide(color: Colors.red, width: 0.8),
    ),
  );
}