import 'package:flutter/material.dart';

class OutlinedButtonThemes {
  OutlinedButtonThemes._();

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.black,
      side: const BorderSide(color: Colors.blue),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600,color: Colors.black),
    ),
  );

  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      side: const BorderSide(color: Colors.blue),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600,color: Colors.white),
    ),
  );
}