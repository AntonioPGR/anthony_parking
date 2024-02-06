import 'package:anthony_parking/components/containers/widget_row.dart';
import 'package:anthony_parking/components/forms/form_container.dart';
import 'package:anthony_parking/components/forms/form_input.dart';
import 'package:anthony_parking/controllers/car_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class UpdateInputs extends StatelessWidget{
  final CarControllers controllers;
  final GlobalKey<FormBuilderState> form_key;
  UpdateInputs({
    required this.form_key,
    required this.controllers,
    super.key
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
              controller: controllers.plate,
              label_text: "Placa"
            ),
            FormInput(
              controller: controllers.color,
              label_text: "Cor"
            ),
          ]
        ),
        WidgetRow(
          widgets: [
            FormInput(
              controller: controllers.model,
              label_text: "Modelo"
            ),
            FormInput(
              controller: controllers.secret,
              label_text: "Segredo"
            ),
          ]
        )

      ],
    );
  }
}