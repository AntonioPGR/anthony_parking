import "package:anthony_parking/pages/configs/config_container.dart";
import "package:anthony_parking/pages/configs/config_field.dart";
import "package:flutter/material.dart";

class ConfigsColumn extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Column(
        children: [
          ConfigContainer(
            title: "Carros",
            fields: [
              ConfigField(
                label: "Quantidade máxima de veículos:",
                controller: TextEditingController(),
              )
            ]
          )
        ],
      ),
    );
  }

}