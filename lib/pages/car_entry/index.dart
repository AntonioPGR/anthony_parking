import 'package:anthony_parking/components/layouts/base_layout.dart';
import 'package:anthony_parking/pages/car_entry/entry_form/index.dart';
import 'package:flutter/material.dart';

class CarEntryPage extends StatelessWidget{
  const CarEntryPage({super.key});

  @override
  Widget build(BuildContext context){
    return BaseLayout(
      child: EntryForm(),
    );
  }
}