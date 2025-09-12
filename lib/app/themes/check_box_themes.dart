// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class CheckBoxThemes {
  CheckBoxThemes._();

  static CheckboxThemeData lightCheckBoxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: MaterialStateProperty.resolveWith((state){
      if (state.contains(MaterialState.selected)) {
        return Colors.white;
      }
      return Colors.black;
    }),

    fillColor: MaterialStateProperty.resolveWith((state){
      if (state.contains(MaterialState.selected)) {
        return Colors.blue;
      }
      return Colors.transparent;
    })
  );

  static CheckboxThemeData darkCheckBoxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: MaterialStateProperty.resolveWith((state){
      if (state.contains(MaterialState.selected)) {
        return Colors.white;
      }
      return Colors.black;
    }),

    fillColor: MaterialStateProperty.resolveWith((state){
      if (state.contains(MaterialState.selected)) {
        return Colors.blue;
      }
      return Colors.transparent;
    })
  );
}