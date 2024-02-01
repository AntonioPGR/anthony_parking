import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StateCarsLimit extends ChangeNotifier{

  late int _cars_limit;
  final SharedPreferences instance;
  final String key = "cars_limit_key";

  StateCarsLimit({required this.instance}){
    _loadCarsLimit();
  }

  void _loadCarsLimit(){
    _cars_limit = instance.getInt(key) ?? 30;
  }

  int getCarsLimit(){
    return _cars_limit;
  }

  void setCarsLimit(int new_limit){
    instance.setInt(key, new_limit);
  }

}