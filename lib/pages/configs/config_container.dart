import "package:anthony_parking/components/buttons/button.dart";
import 'package:anthony_parking/components/custom_widgets/custom_column.dart';
import "package:anthony_parking/components/titles/page_title.dart";
import "package:anthony_parking/pages/configs/config_field.dart";
import "package:flutter/material.dart";

class ConfigContainer extends StatelessWidget {
  final String title;
  final List<ConfigField> fields;
  final void Function() onSubmit;

  const ConfigContainer({
    required this.title, 
    required this.fields, 
    required this.onSubmit,
    super.key, 
    });

  @override
  Widget build(BuildContext context) {
    return CustomColumn(
      gap_size: 32,
      children: [
        PageTitle(title), 
        ...fields,
        Button(
          width: MediaQuery.of(context).size.width * .5,
          label: "Confirmar Alterações", 
          on_press: onSubmit
        )
      ]);
  }
}
