import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StateHeaderTitle extends ChangeNotifier{

  String _header_title = "Parking";
  final SharedPreferences instance;
  final String key = "cars_header_title";

  StateHeaderTitle({required this.instance}){
    _load();
  }

  void _load(){
    _header_title = instance.getString(key) ?? _header_title;
  }

  String get(){
    return _header_title;
  }

  void set(String item){
    instance.setString(key, item);
    _load();
    notifyListeners();
  }

}