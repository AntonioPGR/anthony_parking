import 'package:anthony_parking/components/buttons/Button.dart';
import 'package:anthony_parking/components/snackbar/snackbar.dart';
import 'package:anthony_parking/components/titles/page_title.dart';
import 'package:anthony_parking/data/cars_list/cars_list.dart';
import 'package:anthony_parking/data/current_car/current_selected_car.dart';
import 'package:anthony_parking/models/car_model.dart';
import 'package:anthony_parking/pages/car_exit/exit_form/form_handlers/exit_controllers.dart';
import 'package:anthony_parking/pages/car_exit/exit_form/price_displayer.dart';
import 'package:anthony_parking/tools/page_navigator.dart';
import 'package:anthony_parking/tools/price_calculator.dart';
import 'package:anthony_parking/validators/base_validator_methods.dart';
import 'package:anthony_parking/validators/car_validator/plate_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';
import 'exit_inputs.dart';
import 'package:flutter/src/widgets/framework.dart';


class ExitForm extends StatefulWidget {
  @override
  State<ExitForm> createState() => _ExitFormState();
}

class _ExitFormState extends State<ExitForm> {
  final _form_key = GlobalKey<FormBuilderState>();
  final controllers = ExitControllers();
  final PriceCalculator price_calculator = PriceCalculator();
  late StateCarList cars_list_state;
  late StateCurrentCar current_car_state;

  void assignModelToControllers(){
    CarModel? car = current_car_state.getCurrentCar();
    car != null? controllers.assingValueFrom(car) : controllers.cleanExceptPlate();
  }

  double getPrice(){
    CarModel? current_car = current_car_state.getCurrentCar();
    if(!BaseValidator.isNull(current_car)){
      return price_calculator.calculateCarPrice(current_car!);
    }
    return 0;
  }

  onPlateChange(String? new_plate){
    CarModel? car = cars_list_state.getCarByPlate(new_plate ?? "");
    if(!PlateValidator.isValid(new_plate) || BaseValidator.isNull(car)) {
      current_car_state.clearCurrentCar();
      return;
    }
    current_car_state.setCurrentCar(car!);
  }

  onSubmit(BuildContext context){
    CarModel? car = current_car_state.getCurrentCar();
    if(!BaseValidator.isNull(car)){
      cars_list_state.deleteCarById(car!.uuid!);
      current_car_state.clearCurrentCar();
      messageSnackBar(context, "Carro removido com sucesso");
      PageNavigator.goHome(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    cars_list_state = Provider.of<StateCarList>(context);
    current_car_state = Provider.of<StateCurrentCar>(context);
    assignModelToControllers();

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const PageTitle("Saída de veículos"),
          PriceDisplayer(
            price: getPrice(),
          ),
          ExitInputs(
            controllers: controllers,
            form_key: _form_key,
            on_plate_change: onPlateChange,
          ),
          Button(
            label: "Confirmar saída",
            on_press: () => onSubmit(context)
          )
        ],
      ),
    );
  }
}


