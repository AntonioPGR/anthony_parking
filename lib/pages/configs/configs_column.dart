import "dart:ffi";

import "package:anthony_parking/data/settings/cars_limit.dart";
import "package:anthony_parking/data/settings/header_title.dart";
import "package:anthony_parking/pages/configs/config_container.dart";
import "package:anthony_parking/pages/configs/config_field.dart";
import "package:anthony_parking/tools/page_navigator.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:provider/provider.dart";

class ConfigsColumn extends StatelessWidget{
  ConfigsColumn({super.key});
  late StateCarsLimit state_cars_limit; 
  late StateHeaderTitle state_header_title; 

  final cars_limit_controller = TextEditingController();
  final header_title_controller = TextEditingController();

  void onSubmit(BuildContext context){
    int new_cars_limit = int.parse(cars_limit_controller.text);
    state_cars_limit.set(new_cars_limit);
    String new_header_title = header_title_controller.text;
    state_header_title.set(new_header_title);
    PageNavigator.goHome(context);
  }

  @override
  Widget build(BuildContext context) {
    state_cars_limit = Provider.of<StateCarsLimit>(context);
    state_header_title = Provider.of<StateHeaderTitle>(context);
    if(cars_limit_controller.text == null || cars_limit_controller.text.isEmpty){
      cars_limit_controller.text = state_cars_limit.get().toString();
    }
    if(header_title_controller.text == null || header_title_controller.text.isEmpty){
      header_title_controller.text = state_header_title.get().toString();
    }

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Column(
        children: [
          ConfigContainer(
            title: "Configurações",
            fields: [
              ConfigField(
                label: "Quantidade máxima de veículos:",
                controller: cars_limit_controller,
              ),
              ConfigField(
                label: "Titulo no cabeçalho:",
                controller: header_title_controller,
              ),
            ],
            onSubmit: () => onSubmit(context)
          )
        ],
      ),
    );
  }
}