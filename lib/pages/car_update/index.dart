import 'package:anthony_parking/layouts/base_layout.dart';
import 'package:anthony_parking/pages/car_update/update_form/index.dart';
import 'package:flutter/cupertino.dart';

class CarUpdatePage extends StatelessWidget{
  const CarUpdatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: UpdateForm()
    );
  }
}