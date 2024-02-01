import 'package:anthony_parking/assets/themes/theme_colors.dart';
import 'package:anthony_parking/data/current_car/current_selected_car.dart';
import 'package:anthony_parking/models/car_model.dart';
import 'package:anthony_parking/pages/home/index.dart';
import 'package:anthony_parking/tools/page_navigator.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

Text _dataRowText(String label) => Text(label);

DataRow createCarRow(BuildContext context, CarModel car, int? rowIndex){

  MaterialStateProperty<Color> getRowColor(int index){
    Color color = ThemeColors.off_white_2;
    if(index % 2 == 0){
      color = ThemeColors.beige;
    }
    return MaterialStateProperty.all<Color>(color);
  }

  StateCurrentCar current_car_state = Provider.of<StateCurrentCar>(context);

  return DataRow(
    color: rowIndex != null? getRowColor(rowIndex) : null,
    cells: [
      DataCell(_dataRowText(car.plate)),
      DataCell(_dataRowText(car.model ?? "")),
      DataCell(_dataRowText(car.color ?? "")),
      DataCell(_dataRowText(DateFormat("dd/MM - HH:mm").format(car.entry_time))),
      DataCell(
        TextButton(
          child: Text(
            "Ver informações",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: ThemeColors.blue,
              decoration: TextDecoration.underline,
              decorationColor: ThemeColors.blue,
            )
          ),
          onPressed: (){
            current_car_state.setCurrentCar(car);
            PageNavigator.goHome(context);
          },
        )
      ),
    ]
  );
}
