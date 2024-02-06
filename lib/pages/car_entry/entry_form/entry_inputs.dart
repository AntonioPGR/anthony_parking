import 'package:anthony_parking/components/containers/widget_row.dart';
import 'package:anthony_parking/components/forms/form_container.dart';
import 'package:anthony_parking/components/forms/form_input.dart';
import 'package:anthony_parking/controllers/car_controller.dart';
import 'package:anthony_parking/pages/car_entry/entry_form/form_handlers/entry_validators.dart';
import 'package:anthony_parking/validators/car_validator/plate_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gap/gap.dart';

class EntryInputs extends StatelessWidget {
  final CarControllers controllers;
  final GlobalKey<FormBuilderState> form_key;
  const EntryInputs({
    required this.form_key,
    required this.controllers,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FormContainer(
      form_key: form_key,
      gap_size: 16,
      inputs: [
        WidgetRow(
          widgets: [
            FormInput(
              label_text: "Placa",
              hint_text: "AAA0000 ou AAA0A00",
              controller: controllers.plate,
              required: true,
              validator: EntryValidators.validatePlate,
              capitalize: true,
              formatters: [
                PlateFormatter,
              ],
            ),
            FormInput(
              label_text: "Cor",
              hint_text: "Insira uma cor",
              controller: controllers.color,
              validator: EntryValidators.validateColor,
            ),
          ]
        ),
        FormInput(
          label_text: "Modelo",
          hint_text: "Insira o modelo do carro",
          controller: controllers.model,
        ),
        FormInput(
          label_text: "Segredo",
          hint_text: "Insira o segredo que o carro contém",
          controller: controllers.secret,
        ),
      ],
    );
  }
}