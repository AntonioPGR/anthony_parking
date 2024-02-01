import 'package:anthony_parking/models/car_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

class EntryControllers{
  TextEditingController plate = TextEditingController();
  TextEditingController model = TextEditingController();
  TextEditingController color = TextEditingController();
  TextEditingController secret = TextEditingController();
  Uuid uuid_generator = Uuid();

  CarModel createCarFromControllers(){
    return CarModel(
      plate: plate.text,
      entry_time: DateTime.now(),
      model: model.text,
      color: color.text,
      secret: secret.text,
      uuid: uuid_generator.v1()
    );
  }

}