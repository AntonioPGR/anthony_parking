import 'package:anthony_parking/models/car_model.dart';
import 'package:flutter/widgets.dart';

class StateCurrentCar extends ChangeNotifier{

  CarModel? _current_car;

  StateCurrentCar({
    CarModel? current_car,
  }) : _current_car = current_car;

  CarModel? getCurrentCar(){
    return _current_car;
  }

  void setCurrentCar(CarModel car){
    this._current_car = car;
    notifyListeners();
  }

  void clearCurrentCar(){
    this._current_car = null;
    notifyListeners();
  }

}