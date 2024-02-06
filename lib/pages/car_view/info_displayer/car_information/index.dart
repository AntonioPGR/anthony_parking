import 'package:anthony_parking/assets/themes/theme_colors.dart';
import 'package:anthony_parking/components/inputs/input_row.dart';
import 'package:anthony_parking/models/car_model.dart';
import 'package:flutter/cupertino.dart';

class CarInformation extends StatelessWidget{
  CarModel current_car;
  CarInformation({
    required this.current_car,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WidgetRow(
          first_input: ColoredBox(
            color: ThemeColors.brown,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(current_car.plate),
            ),
          ),
          last_input: ColoredBox(
            color: ThemeColors.brown,
            child: Text(current_car.plate),
          )
        )
      ],
    );
  }
}