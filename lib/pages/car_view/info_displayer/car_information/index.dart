import "package:anthony_parking/components/containers/widget_column.dart";
import "package:anthony_parking/components/containers/widget_row.dart";
import "package:anthony_parking/models/car_model.dart";
import "package:anthony_parking/pages/car_view/info_displayer/car_information/info_container.dart";
import "package:flutter/cupertino.dart";
import "package:intl/intl.dart";

class CarInformation extends StatelessWidget{
  CarModel current_car;
  CarInformation({
    required this.current_car,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return WidgetColumn(
      gap_size: 16,
      widgets: [
        WidgetRow(
          widgets: [
            InfoContainer(
              text: current_car.plate,
              label: "Placa",
            ),
            InfoContainer(
              text: current_car.color ?? "",
              label: "Cor",
            ),
          ]
        ),
        WidgetRow(
          widgets: [
            InfoContainer(
              text: current_car.model ?? "",
              label: "Modelo",
            ),
            InfoContainer(
              text: DateFormat("dd/MM HH:mm:ss").format(current_car.entry_time).toString(),
              label: "Entrada",
            ),
          ]
        ),
        WidgetRow(
          widgets: [
            InfoContainer(
              text: current_car.secret ?? "",
              label: "segredo"
            )
          ],
        )
      ],
    );
  }
}