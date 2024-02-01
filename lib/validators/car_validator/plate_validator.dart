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

}