import 'package:anthony_parking/assets/themes/theme.dart';
import 'package:anthony_parking/pages/home/index.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Anthony Parking',
        theme: light_theme,
        home: const HomePage()
    );
  }
}