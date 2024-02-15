import 'package:anthony_parking/components/custom_widgets/custom_row.dart';
import "package:flutter/material.dart";
import "package:flutter_form_builder/flutter_form_builder.dart";

class ConfigField extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const ConfigField({super.key, required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CustomRow(gap_size: 16, children: [
      Text(label),
      Expanded(
          child: FormBuilderTextField(
        name: label,
        controller: controller,
      ))
    ]);
  }
}
