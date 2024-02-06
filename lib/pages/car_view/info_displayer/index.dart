import 'package:anthony_parking/components/ImageLoader/index.dart';
import 'package:anthony_parking/components/layouts/two_sides_layout.dart';
import 'package:anthony_parking/components/titles/page_title.dart';
import 'package:anthony_parking/data/current_car/current_selected_car.dart';
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

  @override
  Widget build(BuildContext context) {
    current_car_state = Provider.of<StateCurrentCar>(context);
    current_car = current_car_state.getCurrentCar();
    if(current_car == null){
      PageNavigator.goHome(context);
    }
    return TwoSidesLayout(
      left_child: ImageLoader(
        allow_image_change: false,
        initial_image_path: current_car!.photo ?? "",
      ),
      right_child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const PageTitle("Informações do veículo"),
            CarInformation(current_car: current_car!),
            ViewOptions()
          ],
        )
      ),
    );
  }

}