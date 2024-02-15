import 'package:anthony_parking/layouts/base_layout.dart';
import 'package:anthony_parking/layouts/two_sides_layout.dart';
import "package:anthony_parking/pages/home/cars_table/index.dart";
import "package:anthony_parking/pages/home/side_bar/index.dart";
import "package:flutter/material.dart";

class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: TwoSidesLayout(
        gap_size: 16,
        left_child: CarsTable(),
        right_child: const SideBar(),
      )
    );
  }

}