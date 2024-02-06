import 'package:anthony_parking/data/box/box_handler.dart';
import 'package:anthony_parking/data/box/boxes.dart';
import 'package:anthony_parking/models/car_model.dart';
import 'package:hive/hive.dart';

class CarListBoxHandler implements BoxHandler<String, CarModel>{
  @override
  Box<CarModel> box = cars_box;

  @override
  add(CarModel model) {
    box.put(model.uuid!, model);
  }

  @override
  delete(uuid) {
    box.delete(uuid);
  }

  @override
  getAll() {
    int cars_number = box.length;
    List<CarModel>  new_cars_list = [];
    for(int i = 0; i < cars_number; i++){
      CarModel? add_car = cars_box.getAt(i);
      if(add_car != null){
        new_cars_list.add(add_car);
      }
    }
    return new_cars_list;
  }

  @override
  update(uuid, model) {
    box.put(uuid, model);
  }

  @override
  CarModel? getUniqueById(String key) {
    return box.get(key);
  }

}