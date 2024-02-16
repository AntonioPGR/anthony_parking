import 'package:flutter/cupertino.dart';

class WidgetsListFunctions{

  static insertBetween(List<Widget> list, Widget insert_element){
    List<Widget> new_list = [];
    for (int i = 0; i < list.length; i++) {
      if (i != 0) {
        new_list.add(insert_element);
      }
      new_list.add(list[i]);
    }
    return new_list;
  }
}