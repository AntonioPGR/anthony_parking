// ignore_for_file: constant_identifier_names

import "package:flutter/material.dart";

class ThemeColors {
  static const off_white = Color.fromRGBO(242, 226, 206, 1);
  static const off_white_2 = Color.fromRGBO(222, 202, 176, 1);
  static const beige = Color.fromRGBO(217, 165, 119, 1);
  static const light_brown = Color.fromRGBO(166, 117, 65, 1);
  static const brown = Color.fromRGBO(155, 64, 34, 1);
  static const dark_brown = Color.fromRGBO(38, 18, 6, 1);
  static const green = Color.fromRGBO(0, 204, 0, 1);
  static const red = Color.fromRGBO(204, 0, 0, 1);
  static const yellow = Color.fromRGBO(255, 191, 0, 1);
  static const blue = Color.fromRGBO(15, 82, 186, 1);
  static const gray = Color.fromRGBO(150, 150, 150, 1);
  static const black = Color.fromRGBO(26, 26, 26, 1);

  static MaterialStateProperty<Color> toMaterialFormat(Color color) {
    return MaterialStateProperty.all<Color>(color);
  }
}
