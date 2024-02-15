import 'package:anthony_parking/interfaces/box_handler_interface.dart';
import 'package:anthony_parking/models/car_model.dart';
import 'package:hive/hive.dart';

late Box<CarModel> hive_cars_box;

class CarListBoxHandler extends BoxHandlerInterface<String, CarModel>{
  Box<CarModel> box = hive_cars_box;
  
  @override
  Box<CarModel> getBox() => box;
}