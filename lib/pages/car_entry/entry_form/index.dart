import "package:anthony_parking/assets/themes/theme_colors.dart";
import "package:anthony_parking/components/ImageLoader/index.dart";
import "package:anthony_parking/components/custom_widgets/custom_full_expanded.dart";
import "package:anthony_parking/components/forms/default_form_layout.dart";
import 'package:anthony_parking/layouts/two_sides_layout.dart';
import "package:anthony_parking/components/snackbar/snackbar.dart";
import "package:anthony_parking/controllers/car_controller.dart";
import "package:anthony_parking/data/cars_list/cars_list.dart";
import "package:anthony_parking/models/car_model.dart";
import "package:anthony_parking/pages/car_entry/entry_form/entry_inputs.dart";
import "package:anthony_parking/tools/image_text_recognizer.dart";
import "package:anthony_parking/tools/page_navigator.dart";
import "package:anthony_parking/validators/car_validator/plate_validator.dart";
import "package:camera/camera.dart";
import "package:flutter/material.dart";
import "package:flutter_form_builder/flutter_form_builder.dart";
import "package:gap/gap.dart";
import "package:provider/provider.dart";

class EntryForm extends StatelessWidget {
  EntryForm({super.key});

  final form_key = GlobalKey<FormBuilderState>();
  final controllers = CarControllers();
  final text_recognizer = ImageTextRecognizer();

  late StateCarsList car_list_state;

  onSubmit(BuildContext context) {
    if (form_key.currentState!.validate()) {
      try {
        CarModel new_car = controllers.createModel();
        car_list_state.add(new_car.uuid, new_car);
        messageSnackBar(context, "Carro adicionado com sucesso");
        PageNavigator.goHome(context);
      } catch (excp) {
        messageSnackBar(context, "Este carro já está no pátio");
      }
    }
  }

  onImageChange(BuildContext context, XFile? image) async {
    if (image != null) {
      try {
        controllers.photo_path = image.path;
        String? recognized_text = await text_recognizer.RecognizeTextFrom(image);
        String new_plate = PlateValidator.tryToFormat(recognized_text ?? "");
        controllers.plate.text = new_plate;
      } catch (e) {
        messageSnackBar(context, "Não foi possivel reconhecer nenhuma placa automotiva na imagem!");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    car_list_state = Provider.of<StateCarsList>(context);

    return Row(
      children: [
        SizedBox(width: 300,child:ColoredBox(color: ThemeColors.beige,)),
        Gap(48),
        Expanded(child: ColoredBox(color: ThemeColors.beige,))
      ],
    );
  }
}
