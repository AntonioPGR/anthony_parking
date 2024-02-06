import 'package:anthony_parking/validators/base_validator_methods.dart';

class PlateValidator{

  static String? validate(String? value) {
    if(BaseValidator.isNull(value) || BaseValidator.isEmpty(value!)){
      return "Campo placa deve ser preenchido";
    }
    if(!BaseValidator.matchesRegex(value!, "^([A-Z]{3}-[0-9]{1}[0-9A-Z]{1}[0-9]{2})\$")){
      return "Exemplo: AAA-0000 ou AAA-0A00!";
    }
    return null;
  }

  static bool isValid(String? value){
    return validate(value) != null? false : true;
  }

  static String tryToFormat(String plate) {
    plate = plate.replaceAll(" ", "");
    plate = plate.replaceAll("-", "");
    print(plate);
    if(isValid(plate)){
      return plate;
    }
    if(BaseValidator.matchesRegex(plate, "^([A-Z]{3}[0-9]{1}[0-9A-Z]{1}[0-9]{2})\$")){
      String new_plate = "${plate.substring(0, 3)}-${plate.substring(3, plate.length)}";
      return new_plate;
    }
    throw Exception("A string detectada não é valida!");
  }

}