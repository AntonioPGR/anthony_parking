import 'package:anthony_parking/pages/car_entry/index.dart';
import 'package:anthony_parking/pages/home/index.dart';
import 'package:flutter/material.dart';

class PageNavigator{

  static void goTo({
    required BuildContext context,
    required Widget page
  }){
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (newContext) => page
        ),
      );
    });
  }

  static void goHome(BuildContext context){
    PageNavigator.goTo(context: context, page: HomePage());
  }

  static goEntry(BuildContext context) {
    PageNavigator.goTo(context: context, page: CarEntryPage());
  }

  static goConfigurations(BuildContext context) {
    PageNavigator.goTo(context: context, page: HomePage());
  }

}