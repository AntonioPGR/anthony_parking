import 'package:anthony_parking/components/camera/index.dart';
import 'package:anthony_parking/components/layouts/base_layout.dart';
import 'package:anthony_parking/components/layouts/two_sides_layout.dart';
import 'package:anthony_parking/pages/car_exit/exit_form/index.dart';
import 'package:flutter/cupertino.dart';

class CarExitPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: TwoSidesLayout(
        left_child: Camera(),
        right_child: ExitForm(),
      ),
    );
  }

}