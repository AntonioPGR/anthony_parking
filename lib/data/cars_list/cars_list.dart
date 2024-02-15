import 'package:anthony_parking/data/cars_list/box_handler.dart';
import 'package:anthony_parking/interfaces/box_handler_interface.dart';
import 'package:anthony_parking/interfaces/box_list_state_interface.dart';
import "package:anthony_parking/models/car_model.dart";

class StateCarsList extends BoxListStateInterface<String, CarModel> {
  StateCarsList({
    super.current = const [], 
  });

  @override
  BoxHandlerInterface<String, CarModel> getBoxHandler() => CarListBoxHandler();

  CarModel? getCarById(String uuid) {
    List<CarModel> car_list = super.get();
    try {
      return car_list.where((element) => element.uuid == uuid).toList()[0];
    } catch (exception) {
      return null;
    }
  }

  CarModel? getCarByPlate(String plate) {
    List<CarModel> car_list = super.get();
    try {
      return car_list
        .where((element) => element.plate == plate)
        .toList()
        .first;
    } catch (exception) {
      return null;
    }
  }
}
