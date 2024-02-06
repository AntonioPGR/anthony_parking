import 'package:anthony_parking/pages/car_entry/index.dart';
import 'package:anthony_parking/pages/car_exit/index.dart';
import 'package:anthony_parking/pages/car_update/index.dart';
import 'package:anthony_parking/pages/car_view/index.dart';
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
    PageNavigator.goTo(context: context, page: const HomePage());
  }

  static goEntry(BuildContext context) {
    PageNavigator.goTo(context: context, page: const CarEntryPage());
  }

  static goConfigurations(BuildContext context) {
    PageNavigator.goTo(context: context, page: const HomePage());
  }

  static void goView(BuildContext context) {
    PageNavigator.goTo(context: context, page: const CarViewPage());
  }

  static goExit(BuildContext context) {
    PageNavigator.goTo(context: context, page: CarExitPage());
  }

  static goUpdate(BuildContext context) {
    PageNavigator.goTo(context: context, page: const CarUpdatePage());
  }

}