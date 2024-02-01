import 'package:anthony_parking/data/box/boxes.dart';
import 'package:flutter/cupertino.dart';
import 'package:anthony_parking/models/car_model.dart';
import 'box_handler.dart';

class StateCarList extends ChangeNotifier{

  List<CarModel> _car_list = [];
  CarListBoxHandler box_handler = CarListBoxHandler();

  StateCarList(){
    _renderCarList();
  }

  // GETTERS
  void _renderCarList(){
    _car_list = box_handler.getAll();
    notifyListeners();
  }

  List<CarModel> getCarsList(){
    return List.from(_car_list);
  }

  CarModel? getCarById(String uuid){
    try{
      return _car_list.where((element) => element.uuid == uuid).toList()[0];
    } catch(exception){
      return null;
    }
  }

  CarModel? getCarByPlate(String plate){
    try{
      return _car_list.where((element) => element.plate == plate).toList().first;
    } catch(exception){
      return null;
    }
  }

  int getNumberOfCars(){
    return _car_list.length;
  }

  // ADDS
  void addCar(CarModel new_car) {
    if(getCarByPlate(new_car.plate) != null){
      throw Exception("Já exite um carro com esta placa;");
    }
    box_handler.add(new_car);
    _renderCarList();
  }

  // UPDATES
  void updateCar(CarModel car_update) {
    box_handler.update(car_update.uuid!, car_update);
    _renderCarList();
  }

  // DELETES
  void deleteCarById(String uuid){
    box_handler.delete(uuid);
    _renderCarList();
  }

}