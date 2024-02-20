import "package:anthony_parking/validators/base_validator_methods.dart";

class PlateValidator{

  static String? validate(String? value) {
    String plate_rgx = "^([A-Z]{3}[0-9]{1}[0-9A-Z]{1}[0-9]{2})\$";
    String plate_rgx_hyphen = "^([A-Z]{3}-[0-9]{1}[0-9A-Z]{1}[0-9]{2})\$";

    if(BaseValidator.isNull(value) || BaseValidator.isEmpty(value!)){
      return "Campo placa deve ser preenchido";
    }
    if(!BaseValidator.matchesRegex(value, plate_rgx) && !BaseValidator.matchesRegex(value, plate_rgx_hyphen)){
      return "Exemplo: AAA-0000 ou AAA-0A00!";
    }
    return null;
  }

  static bool isValid(String? value){
    return validate(value) != null? false : true;
  }

  static String cleanPlate(String dirty_plate){
    return dirty_plate.replaceAll(" ", "")
      .replaceAll(RegExp('[^A-Za-z0-9]'), "")
      .toUpperCase();
  }

  static String? findPlateIn(String text){
    int plate_length = 7;
    for(int i = 0; i + plate_length <= text.length; i++){
      String current_string = text.substring(i, i + plate_length);
      if(isValid(current_string)){
        return current_string;
      }
      String? false_alarms = tryChangingFalseAlarms(current_string);
      if(isValid(false_alarms)){
        return current_string;
      }
    }
  }

  static String addPlateHyphen(String plate){
    String new_plate = "${plate.substring(0, 3)}-${plate.substring(3, plate.length)}";
    return new_plate;
  }

  static String tryToFormat(String plate_text) {
    String clean_plate_text = cleanPlate(plate_text);
    String? plate = findPlateIn(clean_plate_text);
    if(plate != null){
      print("ok");
      return addPlateHyphen(plate);
    }
    throw Exception("A string detectada não é valida!");
  }
  
  static String tryChangingFalseAlarms(String current_string) {
    String plate_chars = current_string.substring(0,3);
    String plate_numbers = current_string.substring(3, current_string.length);
    
    plate_chars.replaceAll("0", "O");
    plate_numbers.replaceAll("O", "0");
    
    return plate_chars+plate_numbers;
  }

}