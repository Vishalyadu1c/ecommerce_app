
import 'package:ecommerce_app/app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ElevatedButtonThemes {
  ElevatedButtonThemes._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: AppColors.lightThemePrimaryColour, 
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey.shade300,
      side: BorderSide.none,
      minimumSize: Size(double.infinity, 40.0),
      padding: EdgeInsets.symmetric(vertical: 15),
      textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,color: Colors.white),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
  );


  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: AppColors.lightThemePrimaryColour, 
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey.shade300,
      side: BorderSide.none,
      minimumSize: Size(double.infinity, 40.0),
      padding: EdgeInsets.symmetric(vertical: 15),
      textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600,color: Colors.white),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
  );

}