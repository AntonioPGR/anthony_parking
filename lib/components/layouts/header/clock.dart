import 'package:anthony_parking/assets/themes/theme_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClockWidget extends StatelessWidget{
  const ClockWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24),
      child: StreamBuilder(
        stream: Stream.periodic(const Duration(seconds: 1)),
        builder: (context, snapshot){
          return Text(
            DateFormat("dd/MM/yyyy   HH:mm:ss").format(DateTime.now()),
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              color: ThemeColors.brown
            )
          );
        }
      ),
    );
  }
}