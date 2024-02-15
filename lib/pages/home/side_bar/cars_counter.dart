import 'package:anthony_parking/assets/themes/theme_colors.dart';
import 'package:anthony_parking/assets/themes/theme_texts.dart';
import 'package:anthony_parking/data/settings/cars_limit.dart';
import 'package:anthony_parking/data/cars_list/cars_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarsCounter extends StatelessWidget {
  CarsCounter({super.key});
  late StateCarsLimit state_cars_limit;
  late StateCarsList state_cars_list;
  late int cars_max;
  late int cars_current;
  late double cars_ratio;

  getCarsInfo() {
    cars_max = state_cars_limit.get();
    cars_current = state_cars_list.getLenght();
    cars_ratio = cars_current / cars_max;
  }

  Color getBarColor() {
    if (cars_ratio < .5) {
      return ThemeColors.green;
    }
    if (cars_ratio < .75) {
      return ThemeColors.yellow;
    }
    return ThemeColors.red;
  }

  @override
  Widget build(BuildContext context) {
    state_cars_limit = Provider.of<StateCarsLimit>(context, listen: true);
    state_cars_list = Provider.of<StateCarsList>(context, listen: true);
    getCarsInfo();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$cars_current/$cars_max",
          style: ThemeText.titleLarge(color: ThemeColors.brown),
        ),
        LinearProgressIndicator(
          backgroundColor: ThemeColors.light_brown,
          minHeight: 30,
          value: cars_ratio,
          color: getBarColor(),
        ),
      ],
    );
  }
}
