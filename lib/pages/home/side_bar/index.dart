import 'package:anthony_parking/pages/home/side_bar/action_buttons.dart';
import 'package:anthony_parking/pages/home/side_bar/cars_counter.dart';
import 'package:flutter/material.dart';

class SideBar extends StatelessWidget{
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CarsCounter(),
          ActionButtons()
        ],
      ),
    );
  }
}