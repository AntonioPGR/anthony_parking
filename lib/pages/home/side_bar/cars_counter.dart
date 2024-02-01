import 'package:anthony_parking/assets/themes/theme_colors.dart';
import 'package:anthony_parking/data/cars_limit/cars_limit.dart';
import 'package:anthony_parking/data/cars_list/cars_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarsCounter extends StatelessWidget{
  const CarsCounter({super.key});

  @override
  Widget build(BuildContext context) {
    int carsMax = Provider.of<StateCarsLimit>(context, listen: true).getCarsLimit();
    int carsCurrent = Provider.of<StateCarList>(context, listen: true).getNumberOfCars();
    double carsRatio = carsCurrent/carsMax;
    Color? barColor = carsRatio < .5? ThemeColors.green : (carsRatio < .75? ThemeColors.yellow : ThemeColors.red);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$carsCurrent/$carsMax",
          style: const TextStyle(
              fontSize: 41,
              color: ThemeColors.brown,
              fontWeight: FontWeight.w700
          ),
        ),
        LinearProgressIndicator(
          backgroundColor: ThemeColors.light_brown,
          minHeight: 30,
          value: carsRatio,
          color: barColor,
        ),
      ],
    );


  }

}