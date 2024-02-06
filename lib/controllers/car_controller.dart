import "package:anthony_parking/models/car_model.dart";
import "package:flutter/cupertino.dart";
import "package:intl/intl.dart";
import "package:uuid/uuid.dart";

class CarControllers{
  CarModel? current_model;
  final TextEditingController plate = TextEditingController();
  final TextEditingController color = TextEditingController();
  final TextEditingController model = TextEditingController();
  final TextEditingController secret = TextEditingController();
  final TextEditingController entry_time = TextEditingController();
  final TextEditingController current_time = TextEditingController();
  String photo_path = "";

  CarModel create(){
    Uuid uuid_generator = const Uuid();
    return CarModel(
      plate: plate.text,
      model: model.text,
      color: color.text,
      secret: secret.text,
      entry_time: DateTime.now(),
      uuid: uuid_generator.v1(),
      photo: photo_path
    );
  }

  CarModel? getCurrent(){
    if(current_model != null){
      return CarModel(
        plate: plate.text,
        color: color.text,
        model: model.text,
        secret: secret.text,
        entry_time: current_model!.entry_time,
        uuid: current_model!.uuid,
        photo: photo_path
      );
    }
    return null;
  }

  void updateValues(CarModel current_car) {
    current_model = current_car;
    plate.text = current_car.plate;
    color.text = current_car.color ?? " ";
    entry_time.text = DateFormat("HH:mm:ss").format(current_car.entry_time);
    current_time.text = _calculateCurrentTime(current_car.entry_time);
    model.text = current_car.model ?? " ";
    secret.text = current_car.secret ?? " ";
  }

  String _calculateCurrentTime(DateTime entry_time){
    Duration time_difference = DateTime.now().difference(entry_time);
    int hours = time_difference.inHours;
    int minutes = time_difference.inMinutes - (hours * 60);
    int seconds = time_difference.inSeconds - (hours * 60 * 60 + minutes * 60);
    String time_string = "$hours\hr, $minutes\m e $seconds\s";
    return time_string;
  }

  void cleanExceptPlate() {
    color.text = "";
    entry_time.text = "";
    current_time.text = "";
    model.text = "";
    current_time.text = "";
  }
}