import 'package:anthony_parking/layouts/base_layout.dart';
import 'package:anthony_parking/pages/configs/configs_column.dart';
import "package:flutter/material.dart";

class ConfigsPage extends StatelessWidget {
  const ConfigsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseLayout(
      child: Center(
        child: ConfigsColumn(),
      ) 
    );
  }
}
