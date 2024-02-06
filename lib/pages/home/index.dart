import "package:anthony_parking/components/layouts/base_layout.dart";
import "package:anthony_parking/components/layouts/two_sides_layout.dart";
import "package:anthony_parking/pages/home/cars_table/index.dart";
import "package:anthony_parking/pages/home/side_bar/index.dart";
import "package:flutter/material.dart";

class HomePage extends StatelessWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseLayout(
      child: TwoSidesLayout(
        left_child: CarsTable(),
        right_child: SideBar(),
      )
    );
  }

}