import 'package:anthony_parking/assets/themes/theme_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderTitle extends StatelessWidget{
  const HeaderTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Anthony Park",
      style: Theme.of(context).
        textTheme.titleMedium?.copyWith(
          color: ThemeColors.off_white
      ),
    );
  }

}