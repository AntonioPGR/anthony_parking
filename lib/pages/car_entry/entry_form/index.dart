import "package:anthony_parking/components/ImageLoader/index.dart";
import "package:anthony_parking/components/forms/default_form_layout.dart";
import "package:anthony_parking/components/layouts/two_sides_layout.dart";
import "package:anthony_parking/components/snackbar/snackbar.dart";
import "package:anthony_parking/controllers/car_controller.dart";
import "package:anthony_parking/data/cars_list/cars_list.dart";
import "package:anthony_parking/pages/car_entry/entry_form/entry_inputs.dart";
import "package:anthony_parking/tools/image_text_recognizer.dart";
import "package:anthony_parking/tools/page_navigator.dart";
import "package:anthony_parking/validators/car_validator/plate_validator.dart";
import "package:camera/camera.dart";
import "package:flutter/material.dart";
import "package:flutter_form_builder/flutter_form_builder.dart";
import "package:provider/provider.dart";


class EntryForm extends StatelessWidget {
  EntryForm({super.key});
  final form_key = GlobalKey<FormBuilderState>();
  final controllers = CarControllers();
  late StateCarList car_list_state;
  final text_recognizer = ImageTextRecognizer();

  onSubmit(BuildContext context){
    if(form_key.currentState!.validate()) {
      try{
        car_list_state.addCar(controllers.create());
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

    return TwoSidesLayout(
      left_child: ImageLoader(
        allow_image_change: true,
        onImageChange: (XFile? image) async {
          if(image != null){
            try{
              controllers.photo_path = image.path;
              String? recognized_text = await text_recognizer.RecognizeTextFrom(image);
              String new_plate = PlateValidator.tryToFormat(recognized_text ?? "");
              controllers.plate.text = new_plate;
            } catch(e){
              messageSnackBar(context, "Não foi possivel reconhecer nenhuma placa automotiva na imagem!");
            }
          }
        }
      ),
      right_child: DefaultFormLayout(
        title: "Entrada de veículos",
        form_content: EntryInputs(
          form_key: form_key,
          controllers: controllers
        ),
        button_label: "Confirmar entrada",
        onSubmit: () => onSubmit(context)
      ),
    );
  }
}