import 'package:anthony_parking/components/custom_widgets/custom_column.dart';
import "package:anthony_parking/components/titles/page_title.dart";
import "package:anthony_parking/pages/configs/config_field.dart";
import "package:flutter/material.dart";

class ConfigContainer extends StatelessWidget {
  final String title;
  final List<ConfigField> fields;

  const ConfigContainer({required this.title, required this.fields, super.key});

  @override
  Widget build(BuildContext context) {
    return CustomColumn(children: [PageTitle(title), ...fields]);
  }
}
