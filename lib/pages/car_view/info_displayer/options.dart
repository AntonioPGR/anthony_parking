import 'package:anthony_parking/assets/themes/theme_colors.dart';
import 'package:anthony_parking/components/forms/buttons/Button.dart';
import 'package:anthony_parking/tools/page_navigator.dart';
import 'package:flutter/cupertino.dart';

class ViewOptions extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Button(
          label: "Saida",
          on_press: () => PageNavigator.goExit(context),
          bg_color: ThemeColors.red,
          width: MediaQuery.of(context).size.width * 0.25,
        ),
        Button(
          label: "Edição",
          on_press: () => PageNavigator.goUpdate(context),
          bg_color: ThemeColors.blue,
          width: MediaQuery.of(context).size.width * 0.25,
        )
      ],
    );
  }

}