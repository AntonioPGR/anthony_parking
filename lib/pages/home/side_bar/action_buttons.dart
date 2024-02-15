import 'package:anthony_parking/components/buttons/button_types.dart';
import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: [
        ButtonTypes.entryButton(context),
        ButtonTypes.exitButton(context),
      ],
    );
  }
}
