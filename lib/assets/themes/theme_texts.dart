import "package:flutter/cupertino.dart";

TextStyle createTextStyle({
  required double font_size,
  Color? color,
  bool? bold,
}){
  return TextStyle(
    fontSize: font_size,
    color: color,
    fontWeight: bold == true? FontWeight.bold : FontWeight.normal
  );
}

class ThemeText {
  static titleLarge({Color? color}) => createTextStyle(color: color, font_size: 38, bold: true,);
  static titleMedium({Color? color}) => createTextStyle(color: color, font_size: 32, bold: true);
  static titleSmall({Color? color}) => createTextStyle(color: color, font_size: 28, bold: true);
  static bodyLarge({Color? color}) => createTextStyle(color: color, font_size: 24, bold: false);
  static bodyMedium({Color? color}) => createTextStyle(color: color, font_size: 20, bold: false);
  static bodySmall({Color? color}) => createTextStyle(color: color, font_size: 18, bold: false);
}
