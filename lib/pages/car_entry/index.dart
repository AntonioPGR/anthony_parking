import 'package:anthony_parking/components/camera/index.dart';
import 'package:anthony_parking/components/layouts/base_layout.dart';
import 'package:anthony_parking/components/layouts/two_sides_layout.dart';
import 'package:anthony_parking/pages/car_entry/entry_form/index.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CarEntryPage extends StatelessWidget{
  const CarEntryPage({super.key});

  @override
  Widget build(BuildContext context){
    return BaseLayout(
      child: TwoSidesLayout(
        left_child: const Camera(),
        right_child: EntryForm(),
      ),
    );
  }
}