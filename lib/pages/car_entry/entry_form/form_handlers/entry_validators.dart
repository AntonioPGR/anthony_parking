import 'package:anthony_parking/validators/base_validator_methods.dart';
import 'package:anthony_parking/validators/car_validator/color_validator.dart';
import 'package:anthony_parking/validators/car_validator/plate_validator.dart';

class EntryValidators{

  static String? validatePlate(String? value){
    if(BaseValidator.isNull(value) || BaseValidator.isEmpty(value!)){
      return "O Campo Placa não pode ser nulo";
    }
    return PlateValidator.validate(value);
  }

  static String? validateColor(String? value){
    if(BaseValidator.isNull(value) || BaseValidator.isEmpty(value!)){
      return null;
    }
   return ColorValidator().validate(value);
  }
}