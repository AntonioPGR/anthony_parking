import 'package:anthony_parking/layouts/camera_title_button_layout.dart';
import "package:anthony_parking/components/snackbar/snackbar.dart";
import "package:anthony_parking/controllers/car_controller.dart";
import "package:anthony_parking/data/cars_list/cars_list.dart";
import "package:anthony_parking/data/current_car/current_selected_car.dart";
import "package:anthony_parking/models/car_model.dart";
import "package:anthony_parking/pages/car_exit/exit_form/price_displayer.dart";
import "package:anthony_parking/tools/page_navigator.dart";
import "package:anthony_parking/tools/price_calculator.dart";
import "package:anthony_parking/validators/base_validator_methods.dart";
import "package:anthony_parking/validators/car_validator/plate_validator.dart";
import "package:flutter/cupertino.dart";
import "package:flutter_form_builder/flutter_form_builder.dart";
import "package:provider/provider.dart";
import "exit_inputs.dart";

class ExitForm extends StatefulWidget {
  const ExitForm({super.key});

  @override
  State<ExitForm> createState() => _ExitFormState();
}

class _ExitFormState extends State<ExitForm> {
  final _form_key = GlobalKey<FormBuilderState>();
  final controllers = CarControllers();
  final PriceCalculator price_calculator = PriceCalculator();
  late StateCarsList cars_list_state;
  late StateCurrentCar current_car_state;
  CarModel? current_car;

  void assignModelToControllers() {
    !BaseValidator.isNull(current_car)? controllers.updateValues(current_car!) : controllers.cleanExceptPlate();
  }

  double getPrice() {
    if (!BaseValidator.isNull(current_car)) {
      return price_calculator.calculateCarPrice(current_car!);
    }
    return 0;
  }

  onPlateChange(String? new_plate) {
    CarModel? car = cars_list_state.getCarByPlate(new_plate ?? "");
    if (!PlateValidator.isValid(new_plate) || BaseValidator.isNull(car)) {
      current_car_state.clear();
      return;
    }
    current_car_state.set(car!);
  }

  onSubmit(BuildContext context) {
    if (!BaseValidator.isNull(current_car)) {
      cars_list_state.delete(current_car!.uuid);
      PageNavigator.goHome(context);
      current_car_state.clear();
      messageSnackBar(context, "Carro removido com sucesso");
    }
  }

  String? getCurrentImage(){
    return current_car?.photo;
  }

  @override
  Widget build(BuildContext context) {
    cars_list_state = Provider.of<StateCarsList>(context);
    current_car_state = Provider.of<StateCurrentCar>(context);
    current_car = current_car_state.get();
    assignModelToControllers();

    return CameraTitleButtonLayout(
      allow_image_change: false,
      initial_image_path: getCurrentImage(),
      page_title: "Saída de Veículos",
      between_widgets: [
        PriceDisplayer(price: getPrice()),
        ExitInputs(
          controllers: controllers,
          form_key: _form_key,
          on_plate_change: onPlateChange,
        ),
      ], 
      button_label: "Confirmar saída",
      onSubmit: () => onSubmit(context),
    );
  }
}
