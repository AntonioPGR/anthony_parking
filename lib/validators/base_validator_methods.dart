class BaseValidator{

  static bool isNull(value){
    return value == null;
  }

  static bool isEmpty(String value){
    return value.isEmpty;
  }

  static bool matchesRegex(String value, String string_regex){
    RegExp regex = RegExp(string_regex);
    if(regex.hasMatch(value)){
      return true;
    }
    return false;
  }

}

