import 'package:anthony_parking/interfaces/box_handler_interface.dart';
import 'package:flutter/material.dart';

abstract class BoxListStateInterface<Key, Model> extends ChangeNotifier{
  List<Model> _current;
  BoxListStateInterface({
    required List<Model> current,
  }) : _current = current{
    _reRenderState();
  }

  BoxHandlerInterface<Key, Model> getBoxHandler();

  void _reRenderState() {
    _current = getBoxHandler().getAll();
    notifyListeners();
  }

  List<Model> get() {
    return List.from(_current);
  }

  int getLenght() {
    return _current.length;
  }

  void add(Key key, Model item) {
    getBoxHandler().add(key, item);
    _reRenderState();
  }

  void update(Key key, Model car_update) {
    getBoxHandler().update(key, car_update);
    _reRenderState();
  }

  void delete(Key key) {
    getBoxHandler().delete(key);
    _reRenderState();
  }
}