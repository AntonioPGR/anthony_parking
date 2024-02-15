import 'package:anthony_parking/components/custom_widgets/custom_row.dart';
import 'package:anthony_parking/components/forms/form_container.dart';
import 'package:anthony_parking/components/forms/form_input.dart';
import 'package:anthony_parking/controllers/car_controller.dart';
import 'package:anthony_parking/validators/car_validator/plate_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ExitInputs extends StatelessWidget {
  final CarControllers controllers;
  final GlobalKey<FormBuilderState> form_key;
  final void Function(String?) on_plate_change;
  const ExitInputs(
      {required this.controllers,
      required this.on_plate_change,
      required this.form_key,
      super.key});

  @override
  Widget build(BuildContext context) {
    return FormContainer(
      form_key: form_key,
      gap_size: 16,
      inputs: [
        CustomRow(children: [
          FormInput(
            controller: controllers.plate,
            label_text: "Placa",
            capitalize: true,
            formatters: [PlateFormatter],
            onChange: on_plate_change,
          ),
          FormInput(
            controller: controllers.color,
            label_text: "Cor",
            read_only: true,
          ),
        ]),
        CustomRow(children: [
          FormInput(
            controller: controllers.model,
            label_text: "Modelo",
            read_only: true,
          ),
          FormInput(
            controller: controllers.secret,
            label_text: "Secredo",
            read_only: true,
          ),
        ]),
        CustomRow(children: [
          FormInput(
            controller: controllers.entry_time,
            label_text: "Entrada",
            read_only: true,
          ),
          FormInput(
            controller: controllers.current_time,
            label_text: "Tempo Decorrido",
            read_only: true,
          ),
        ]),
      ],
    );
  }
}
