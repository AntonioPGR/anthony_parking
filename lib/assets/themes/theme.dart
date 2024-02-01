import 'package:anthony_parking/assets/themes/theme_colors.dart';
import 'package:flutter/material.dart';

ThemeData light_theme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,

  // TEXTS
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontSize: 46,
      fontWeight: FontWeight.w700
    ),
    titleMedium: TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w600
    ),
    titleSmall: TextStyle(
      fontSize: 26,
      fontWeight: FontWeight.w600
    ),
    displayMedium: TextStyle(
      fontSize: 28
    ),
    bodyMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.normal
    ),
    bodySmall: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.normal
    ),
  ),

  // APPBAR
  appBarTheme: const AppBarTheme(
    color: ThemeColors.dark_brown,
    foregroundColor: ThemeColors.off_white,
    toolbarHeight: 120,
  ),

  // INPUT
  inputDecorationTheme: const InputDecorationTheme(
    hintStyle: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.normal
    ),
    labelStyle: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      color: ThemeColors.brown,
    ),
    floatingLabelStyle: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w700,
      color: ThemeColors.dark_brown
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        color: ThemeColors.brown,
        width: 4
      )
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        color: ThemeColors.dark_brown,
        width: 5
      )
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        color: ThemeColors.red,
        width: 5
      )
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        color: ThemeColors.red,
        width: 5
      )
    ),
    errorStyle: TextStyle(
      fontSize: 18,
      color: ThemeColors.red,
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        color: ThemeColors.gray,
        width: 5
      )
    )
  ),
);