import 'package:anthony_parking/data/current_car/current_selected_car.dart';
import 'package:anthony_parking/layouts/camera_title_layout.dart';
import 'package:anthony_parking/models/car_model.dart';
import 'package:anthony_parking/pages/car_view/info_displayer/car_information/index.dart';
import 'package:anthony_parking/pages/car_view/info_displayer/options.dart';
import 'package:anthony_parking/tools/page_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class InfoDisplayer extends StatelessWidget{
  InfoDisplayer({super.key});
  late StateCurrentCar current_car_state;
  late CarModel? current_car;

  String? getCarImage(){
    return current_car?.photo;
  }

  @override
  Widget build(BuildContext context) {
    current_car_state = Provider.of<StateCurrentCar>(context);
    current_car = current_car_state.get();
    if(current_car == null){
      PageNavigator.goHome(context);
    }
    return CameraTitleLayout(
      allow_image_change: false,
      initial_image_path: getCarImage(),
      page_title: "Informações do veículo",
      between_widgets: [
        CarInformation(current_car: current_car!),
        const ViewOptions()
      ],
    );
  }

}