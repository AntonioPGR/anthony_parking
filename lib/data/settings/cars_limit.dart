import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StateCarsLimit extends ChangeNotifier{

  int _cars_limit = 30;
  final SharedPreferences instance;
  final String key = "cars_limit_key";

  StateCarsLimit({required this.instance}){
    _load();
  }

  void _load(){
    _cars_limit = instance.getInt(key) ?? _cars_limit;
  }

  int get(){
    return _cars_limit;
  }

  void set(int item){
    instance.setInt(key, item);
    _load();
    notifyListeners();
  }

}