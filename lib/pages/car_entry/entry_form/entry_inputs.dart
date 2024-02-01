import 'package:anthony_parking/components/form/form_container.dart';
import 'package:anthony_parking/components/inputs/form_input.dart';
import 'package:anthony_parking/components/inputs/input_row.dart';
import 'package:anthony_parking/pages/car_entry/entry_form/form_handlers/entry_controllers.dart';
import 'package:anthony_parking/pages/car_entry/entry_form/form_handlers/entry_validators.dart';
import 'package:anthony_parking/validators/car_validator/plate_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gap/gap.dart';

class EntryInputs extends StatelessWidget {
  final EntryControllers controllers;
  final GlobalKey<FormBuilderState> form_key;
  const EntryInputs({
    required this.form_key,
    required this.controllers,
    super.key,
  });

  final Gap gap = const Gap(24);

  @override
  Widget build(BuildContext context) {
    return FormContainer(
      form_key: form_key,
      inputs: [
        InputRow(
          first_input: FormInput(
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
          last_input: FormInput(
            label_text: "Cor",
            hint_text: "Insira uma cor",
            controller: controllers.color,
            validator: EntryValidators.validateColor,
          ),
        ),
        gap,
        FormInput(
          label_text: "Modelo",
          hint_text: "Insira o modelo do carro",
          controller: controllers.model,
        ),
        gap,
        FormInput(
          label_text: "Segredo",
          hint_text: "Insira o segredo que o carro contém",
          controller: controllers.secret,
        ),
      ],
    );
  }
}