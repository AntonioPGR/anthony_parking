import 'package:anthony_parking/validators/base_validator_methods.dart';
import 'package:anthony_parking/validators/car_validator/plate_validator.dart';

class ColorValidator implements PlateValidator{
  String name = "color";

  @override
  String? validate(String value) {
    if(!BaseValidator.matchesRegex(value, "[A-Za-z]")){
      return "A cor deve possuir apenas letras";
    }
    return null;
  }

}