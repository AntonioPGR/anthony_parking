import 'package:anthony_parking/components/form/form_container.dart';
import 'package:anthony_parking/components/inputs/form_input.dart';
import 'package:anthony_parking/components/inputs/input_row.dart';
import 'package:anthony_parking/pages/car_exit/exit_form/form_handlers/exit_controllers.dart';
import 'package:anthony_parking/validators/car_validator/plate_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gap/gap.dart';


class ExitInputs extends StatelessWidget{
  final ExitControllers controllers;
  final GlobalKey<FormBuilderState> form_key;
  final void Function(String?) on_plate_change;
  const ExitInputs({
    required this.controllers,
    required this.on_plate_change,
    required this.form_key,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return FormContainer(
      form_key: form_key,
      gap_size: 16,
      inputs: [
        InputRow(
          first_input: FormInput(
            controller: controllers.plate,
            label_text: "Placa",
            capitalize: true,
            formatters: [
              PlateFormatter
            ],
            onChange: on_plate_change,
          ),
          last_input: FormInput(
            controller: controllers.color,
            label_text: "Cor",
            read_only: true,
          ),
        ),
        InputRow(
          first_input: FormInput(
            controller: controllers.model,
            label_text: "Modelo",
            read_only: true,
          ),
          last_input: FormInput(
            controller: controllers.secret,
            label_text: "Secredo",
            read_only: true,
          ),
        ),
        InputRow(
          first_input: FormInput(
            controller: controllers.entry_time,
            label_text: "Entrada",
            read_only: true,
          ),
          last_input: FormInput(
            controller: controllers.current_time,
            label_text: "Tempo Decorrido",
            read_only: true,
          ),
        ),
      ],
    );
  }
}