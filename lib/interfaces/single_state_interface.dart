import 'package:flutter/material.dart';

abstract class SingleStateInterface<Model> extends ChangeNotifier{
  Model _current;
  SingleStateInterface({
    required Model current,
  }) : _current = current;


  Model get() {
    return _current;
  }

  void set(Model item) {
    _current = item;
    notifyListeners();
  }
}