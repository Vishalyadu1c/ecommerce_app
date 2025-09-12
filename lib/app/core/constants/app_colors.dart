import 'package:flutter/material.dart';

class AppColors {

  static Color lightThemePrimaryColour = hexToColor('#8E6CEF');

  static Color lightGreyColour = hexToColor('#F4F4F4');

  static Color lightGreySecondaryColour = hexToColor('#f3f3f3');
  // static const Color lightThemePrimaryColour = Color(0xff524eb7);

  static const Color lightThemePrimaryTintColour = Color(0xff9e9cdc);

  static const Color lightThemeSecondaryColour = Color(0xfff76631);

  static const Color lightThemePrimaryTextColour = Color(0xff282344);

  static const Color lightThemeSecondaryTextColour = Color(0xff9491a3);

  static const Color lightThemePinkColour = Color(0xfff08e98);

  static const Color lightThemeWhiteColour = Color(0xffffffff);

  static const Color lightThemeTintStockColour = Color(0xfff6f6f9);

  static const Color lightThemeYellowColour = Color(0xfffec613);

  static const Color lightThemeStockColour = Color(0xffe4e4e9);

  static const Color darkThemeDarkSharpColour = Color(0xff191821);

  static Color darkThemePrimaryColour = hexToColor('#1D182A');
  // static const Color darkThemeBGDark = Color(0xff0e0d11);

  static Color darkThemeSecondaryColour = hexToColor('#342F3F');

  static const Color darkThemeDarkNavBarColour = Color(0xff201f27);
}

 Color hexToColor(String hexCode) {
  final buffer = StringBuffer();
  if (hexCode.length == 6 || hexCode.length == 7) buffer.write('ff'); // default alpha
  buffer.write(hexCode.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}
