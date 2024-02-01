import 'package:anthony_parking/assets/themes/theme_colors.dart';
import 'package:anthony_parking/components/buttons/Button.dart';
import 'package:anthony_parking/pages/car_entry/index.dart';
import 'package:anthony_parking/pages/car_exit/index.dart';
import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget{
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        Button(
          label: "Entrada",
          bg_color: ThemeColors.green,
          on_press: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (newContext) => const CarEntryPage(),
              ),
            );
          }
        ),
        Button(
          label: "Saida",
          bg_color: ThemeColors.red,
          on_press: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (newContext) => CarExitPage()
                )
            );
          }
        ),
      ],
    );
  }
}
