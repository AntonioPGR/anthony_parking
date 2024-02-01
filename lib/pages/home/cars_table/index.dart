import 'package:anthony_parking/assets/themes/theme_colors.dart';
import 'package:anthony_parking/data/cars_list/cars_list.dart';
import 'package:anthony_parking/models/car_model.dart';
import 'package:anthony_parking/pages/home/cars_table/car_colum.dart';
import 'package:anthony_parking/pages/home/cars_table/car_row.dart';
import 'package:anthony_parking/pages/home/cars_table/container_base.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarsTable extends StatelessWidget{
  const CarsTable({super.key});

  @override
  Widget build(BuildContext context) {
    List<CarModel> cars = Provider.of<StateCarList>(context).getCarsList();
    cars.sort((a,b) => b.entry_time.compareTo(a.entry_time));
    return TableBaseContainer(
      table: DataTable(
        columns: createCarColumns(),
        headingTextStyle: Theme.of(context).textTheme.titleSmall?.copyWith(
          color: ThemeColors.off_white
        ),
        headingRowColor: MaterialStateProperty.all<Color>(ThemeColors.dark_brown),
        rows: cars.asMap().entries.map(
          (entry) => createCarRow(context, entry.value, entry.key)
        ).toList(),
        dataTextStyle: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}