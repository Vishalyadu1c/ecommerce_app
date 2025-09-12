// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class BottomSheetThemes {
  BottomSheetThemes._();

  static BottomSheetThemeData lightBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: Colors.white,
    modalBackgroundColor: Colors.white.withOpacity(0.8),
    constraints: BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
  );

  static BottomSheetThemeData darkBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: Colors.black,
    modalBackgroundColor: Colors.black.withOpacity(0.8),
    constraints: BoxConstraints(minWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
  );
}