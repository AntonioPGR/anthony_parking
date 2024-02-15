import 'package:anthony_parking/layouts/base_layout.dart';
import 'package:anthony_parking/pages/car_view/info_displayer/index.dart';
import 'package:flutter/cupertino.dart';

class CarViewPage extends StatelessWidget{
  const CarViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: InfoDisplayer()
    );
  }

}