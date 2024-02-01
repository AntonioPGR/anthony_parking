import 'package:hive_flutter/adapters.dart';
import '../data/box/boxes.dart';
import '../models/car_model.dart';


startHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CarModelAdapter());
  cars_box = await Hive.openBox<CarModel>("cars_box");
}