import 'package:anthony_parking/data/settings/cars_limit.dart';
import 'package:anthony_parking/data/cars_list/cars_list.dart';
import 'package:anthony_parking/data/current_car/current_selected_car.dart';
import 'package:anthony_parking/data/settings/header_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StateProvider extends StatelessWidget {
  final Widget child;
  final SharedPreferences prefs;

  const StateProvider({super.key, required this.child, required this.prefs});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => StateCarsList(),
        ),
        ChangeNotifierProvider(
          create: (context) => StateCurrentCar(),
        ),
        ChangeNotifierProvider(
          create: (context) => StateCarsLimit(instance: prefs),
        ),
        ChangeNotifierProvider(
          create: (context) => StateHeaderTitle(instance: prefs),
        ),
      ],
      child: child,
    );
  }
}
