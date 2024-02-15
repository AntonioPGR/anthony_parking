import 'package:anthony_parking/components/custom_widgets/custom_column.dart';
import 'package:anthony_parking/pages/home/side_bar/action_buttons.dart';
import 'package:anthony_parking/pages/home/side_bar/cars_counter.dart';
import 'package:flutter/material.dart';

class SideBar extends StatelessWidget{
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: CustomColumn(
        main_alignment: MainAxisAlignment.spaceAround,
        children: [
          CarsCounter(),
          const ActionButtons()
        ],
      ),
    );
  }
}