import "package:hive_flutter/adapters.dart";

part "car_model.g.dart";

@HiveType(typeId: 0)
class CarModel{
  @HiveField(0)
  String plate;
  @HiveField(1)
  String? model;
  @HiveField(2)
  DateTime entry_time;
  @HiveField(3)
  String? secret;
  @HiveField(4)
  String? color;
  @HiveField(5)
  String? photo;
  @HiveField(6)
  String uuid;

  CarModel({
    required this.plate,
    this.model = "",
    required this.entry_time,
    this.secret = "",
    this.photo = "",
    this.color = "",
    required this.uuid
  });

  update( {
    String? plate,
    String? model,
    String? secret,
    String? color,
  }){
    this.plate = plate ?? this.plate;
    this.model = model ?? this.model;
    this.secret = secret ?? this.secret;
    this.color = color?? this.color;
  }

}