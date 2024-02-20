import 'package:anthony_parking/components/custom_widgets/custom_row.dart';
import 'package:anthony_parking/components/forms/form_container.dart';
import 'package:anthony_parking/components/forms/form_input.dart';
import 'package:anthony_parking/controllers/car_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class UpdateInputs extends StatelessWidget {
  final CarControllers controllers;
  final GlobalKey<FormBuilderState> form_key;

  const UpdateInputs({
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
        CustomRow(
          gap_size: 16,
          children: [
            Expanded(child: FormInput(controller: controllers.plate, label_text: "Placa")),
            Expanded(child: FormInput(controller: controllers.color, label_text: "Cor")),
          ]
        ),
        CustomRow(
          gap_size: 16,
          children: [
            Expanded(child: FormInput(controller: controllers.model, label_text: "Modelo")),
            Expanded(child: FormInput(controller: controllers.secret, label_text: "Segredo")),
          ]
        )
      ],
    );
  }
}
