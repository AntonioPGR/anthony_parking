import 'package:anthony_parking/assets/themes/theme_colors.dart';
import 'package:anthony_parking/components/buttons/Button.dart';
import 'package:anthony_parking/tools/page_navigator.dart';
import 'package:flutter/material.dart';

class ButtonTypes {
  static Widget entryButton(BuildContext context) => Button(
      label: "Entrada",
      bg_color: ThemeColors.green,
      on_press: () => PageNavigator.goEntry(context));

  static Widget exitButton(BuildContext context) => Button(
      label: "Saida",
      bg_color: ThemeColors.red,
      on_press: () => PageNavigator.goExit(context));
}
