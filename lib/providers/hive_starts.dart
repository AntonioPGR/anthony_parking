import 'package:anthony_parking/data/cars_list/box_handler.dart';
import 'package:anthony_parking/models/car_model.dart';
import 'package:hive_flutter/adapters.dart';


startHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CarModelAdapter());
  hive_cars_box = await Hive.openBox<CarModel>("cars_box");
}