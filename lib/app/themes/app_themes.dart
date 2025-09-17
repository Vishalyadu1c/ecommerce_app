
import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import 'appbar_themes.dart';
import 'bottom_sheet_themes.dart';
import 'check_box_themes.dart';
import 'elevated_button_themes.dart';
import 'outlined_button_themes.dart';
import 'text_field_themes.dart';
import 'text_themes.dart';

class AppThemes {
  AppThemes._();

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Okra',
      brightness: Brightness.light,
      primaryColor: AppColors.lightThemePrimaryColour,
      cardColor: AppColors.lightGreyColour,
      scaffoldBackgroundColor: AppColors.lightThemeWhiteColour,
      textTheme: TextThemes.lightTextTheme,
      appBarTheme: AppbarThemes.lightAppBarTheme,
      checkboxTheme: CheckBoxThemes.lightCheckBoxTheme,
      bottomSheetTheme: BottomSheetThemes.lightBottomSheetTheme,
      inputDecorationTheme: TextFieldThemes.lightThemeInputDecoration,
      outlinedButtonTheme: OutlinedButtonThemes.lightOutlinedButtonTheme,
      elevatedButtonTheme: ElevatedButtonThemes.lightElevatedButtonTheme,
      );

  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Okra',
      brightness: Brightness.dark,
      primaryColor: AppColors.darkThemePrimaryColour,
      cardColor: AppColors.darkThemeSecondaryColour,
      scaffoldBackgroundColor: AppColors.darkThemePrimaryColour,
      textTheme: TextThemes.darkTextTheme,
      appBarTheme: AppbarThemes.darkAppBarTheme,
      checkboxTheme: CheckBoxThemes.darkCheckBoxTheme,
      bottomSheetTheme: BottomSheetThemes.darkBottomSheetTheme,
      inputDecorationTheme: TextFieldThemes.darkThemeInputDecoration,
      outlinedButtonTheme: OutlinedButtonThemes.darkOutlinedButtonTheme,
      elevatedButtonTheme: ElevatedButtonThemes.darkElevatedButtonTheme,
      );
}
