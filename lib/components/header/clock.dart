import 'package:anthony_parking/assets/themes/theme_colors.dart';
import 'package:anthony_parking/assets/themes/theme_texts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ClockWidget extends StatelessWidget {
  Stream loop = Stream.periodic(const Duration(seconds: 1));
  EdgeInsets padding = const EdgeInsets.only(right: 24);
  ClockWidget({super.key});

  getDate() {
    return DateFormat("dd/MM/yyyy  -  HH:mm:ss").format(DateTime.now().subtract(const Duration(hours: 1)));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24),
      child: StreamBuilder(
        stream: loop,
        builder: (context, snapshot) {
          return Text(
            getDate(),
            style: ThemeText.bodyLarge(color: ThemeColors.brown)
          );
        }
      ),
    );
  }
}
