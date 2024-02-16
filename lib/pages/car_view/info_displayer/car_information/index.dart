import 'package:anthony_parking/components/custom_widgets/custom_column.dart';
import "package:anthony_parking/components/custom_widgets/custom_row.dart";
import "package:anthony_parking/models/car_model.dart";
import "package:anthony_parking/pages/car_view/info_displayer/car_information/info_container.dart";
import "package:flutter/cupertino.dart";
import "package:intl/intl.dart";

class CarInformation extends StatelessWidget {
  CarModel current_car;
  CarInformation({required this.current_car, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomColumn(
        gap_size: 16,
        children: [
          CustomRow(
            gap_size: 16,
            children: [
              Expanded(
                child: InfoContainer(
                  text: current_car.plate,
                  label: "Placa",
                )
              ),
              Expanded(
                child: InfoContainer(
                  text: current_car.color ?? "",
                  label: "Cor",
                )
              ),
            ]
          ),
          CustomRow(
            gap_size: 16,
            children: [
              Expanded(
                child: InfoContainer(
                  text: current_car.model ?? "",
                  label: "Modelo",
                )
              ),
              Expanded(
                child: InfoContainer(
                  text: DateFormat("dd/MM HH:mm:ss").format(current_car.entry_time).toString(),
                  label: "Entrada",
                )
              ),
            ]
          ),
          CustomRow(
            children: [
              Expanded(
                child: InfoContainer(
                  text: current_car.secret ?? "", 
                  label: "segredo"
                )
              )
            ]
          )
        ],
      )
    );
  }
}
