import "package:anthony_parking/assets/themes/theme_colors.dart";
import "package:anthony_parking/assets/themes/theme_texts.dart";
import "package:anthony_parking/data/cars_list/cars_list.dart";
import "package:anthony_parking/models/car_model.dart";
import "package:anthony_parking/pages/home/cars_table/car_colum.dart";
import "package:anthony_parking/pages/home/cars_table/car_row.dart";
import "package:anthony_parking/pages/home/cars_table/table_container.dart";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

class CarsTable extends StatelessWidget {
  CarsTable({super.key});
  late StateCarsList state_cars_list;
  List<CarModel> cars_list = [];

  void getCars(BuildContext context) {
    state_cars_list = Provider.of<StateCarsList>(context);
    cars_list = state_cars_list.get();
    cars_list.sort((a, b) => b.entry_time.compareTo(a.entry_time));
  }

  List<DataRow> loadCarsRows(BuildContext context) {
    return cars_list
        .asMap()
        .entries
        .map((entry) => createCarRow(context, entry.value, entry.key))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    getCars(context);

    return TableContainer(
      table: DataTable(
        headingTextStyle: ThemeText.bodyLarge(color: ThemeColors.off_white),
        headingRowColor: ThemeColors.toMaterialFormat(ThemeColors.dark_brown),
        columns: createCarColumns(),
        rows: loadCarsRows(context),
        dataTextStyle: ThemeText.bodyMedium(),
      ),
    );
  }
}
