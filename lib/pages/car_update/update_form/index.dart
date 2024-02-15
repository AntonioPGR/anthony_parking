import 'package:anthony_parking/components/ImageLoader/index.dart';
import 'package:anthony_parking/components/forms/default_form_layout.dart';
import 'package:anthony_parking/layouts/two_sides_layout.dart';
import 'package:anthony_parking/components/snackbar/snackbar.dart';
import 'package:anthony_parking/controllers/car_controller.dart';
import 'package:anthony_parking/data/cars_list/cars_list.dart';
import 'package:anthony_parking/data/current_car/current_selected_car.dart';
import 'package:anthony_parking/models/car_model.dart';
import 'package:anthony_parking/pages/car_update/update_form/update_inputs.dart';
import 'package:anthony_parking/tools/page_navigator.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:provider/provider.dart';

class UpdateForm extends StatelessWidget {
  UpdateForm({super.key});
  final controllers = CarControllers();
  final GlobalKey<FormBuilderState> form_key = GlobalKey<FormBuilderState>();
  late StateCurrentCar current_car_state;
  late StateCarsList car_list_state;

  void assignCurrenctCarData(BuildContext context) {
    CarModel? car = current_car_state.get();
    if (car == null) {
      PageNavigator.goHome(context);
    }
    controllers.updateValues(car!);
  }

  void onSubmit(BuildContext context) {
    if (form_key.currentState!.isValid) {
      CarModel current_car = controllers.getCurrent()!;
      car_list_state.update(current_car.uuid, current_car);
      messageSnackBar(context, "Carro editado com sucesso");
      PageNavigator.goHome(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    current_car_state = Provider.of<StateCurrentCar>(context);
    car_list_state = Provider.of<StateCarsList>(context);
    if (current_car_state.get() == null) {
      PageNavigator.goHome(context);
    }
    assignCurrenctCarData(context);

    return TwoSidesLayout(
      left_child: ImageLoader(
        allow_image_change: true,
        initial_image_path: current_car_state.get()!.photo ?? "",
        onImageChange: (XFile? image) async {
          if (image != null) {
            controllers.photo_path = image.path;
          }
        },
      ),
      right_child: DefaultFormLayout(
        title: "Editar veículo",
        form_content: UpdateInputs(
          form_key: form_key,
          controllers: controllers,
        ),
        button_label: "Confirmar edição",
        onSubmit: () => onSubmit(context),
      ),
    );
  }
}
