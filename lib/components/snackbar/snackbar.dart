import 'package:anthony_parking/assets/themes/theme_colors.dart';
import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> messageSnackBar(BuildContext context, String text){
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
        style: const TextStyle(
          color: ThemeColors.off_white,
          fontWeight: FontWeight.w700,
          fontSize: 24
        ),
      ),
      duration: const Duration(milliseconds: 2000),
      backgroundColor: ThemeColors.brown,
      margin: const EdgeInsets.all(16),
      behavior: SnackBarBehavior.floating,
      padding: const EdgeInsets.all(16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8))
      ),
    )
  );
}
