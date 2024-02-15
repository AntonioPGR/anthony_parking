import 'package:anthony_parking/interfaces/single_state_interface.dart';
import 'package:anthony_parking/models/car_model.dart';

class StateCurrentCar extends SingleStateInterface<CarModel?>{

  StateCurrentCar({
    super.current,
  });

  void clear(){
    super.set(null);
  }

}