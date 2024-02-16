import 'package:anthony_parking/layouts/base_layout.dart';
import 'package:anthony_parking/pages/car_exit/exit_form/index.dart';
import 'package:flutter/cupertino.dart';

class CarExitPage extends StatelessWidget{
  const CarExitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseLayout(
      child: ExitForm(),
    );
  }

}