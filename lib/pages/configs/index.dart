import 'package:anthony_parking/layouts/base_layout.dart';
import 'package:anthony_parking/pages/configs/configs_column.dart';
import "package:flutter/material.dart";

class ConfigsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: Center(
        child: ConfigsColumn(),
      ) 
    );
  }
}
