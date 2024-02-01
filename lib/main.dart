import 'package:anthony_parking/app.dart';
import 'package:anthony_parking/providers/hive_starts.dart';
import 'package:anthony_parking/providers/state_provider.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  await startHive();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(
    StateProvider(
      prefs: prefs,
      child: const App(),
    )
  );
}

