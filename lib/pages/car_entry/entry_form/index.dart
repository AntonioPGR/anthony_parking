import 'package:anthony_parking/components/buttons/Button.dart';
import 'package:anthony_parking/components/snackbar/snackbar.dart';
import 'package:anthony_parking/data/cars_list/cars_list.dart';
import 'package:anthony_parking/pages/car_entry/entry_form/form_handlers/entry_controllers.dart';
import 'package:anthony_parking/pages/car_entry/entry_form/entry_inputs.dart';
import 'package:anthony_parking/tools/page_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

class EntryForm extends StatelessWidget {
  EntryForm({super.key});
  final form_key = GlobalKey<FormBuilderState>();
  final controllers = EntryControllers();
  late StateCarList car_list_state;

  onSubmit(BuildContext context){
    if(form_key.currentState!.validate()) {
      try{
        car_list_state.addCar(controllers.createCarFromControllers());
        messageSnackBar(context, "Carro adicionado com sucesso");
        PageNavigator.goHome(context);
      } catch(excp) {
        messageSnackBar(context, "Este carro já está no pátio");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    car_list_state = Provider.of<StateCarList>(context);

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "Entrada de veículos",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          EntryInputs(
            form_key: form_key,
            controllers: controllers
          ),
          Button(
            label: "Confirmar entrada",
            on_press: () => onSubmit(context)
          )
        ],
      )
    );
  }
}