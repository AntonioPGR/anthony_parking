import 'package:flutter/material.dart';

class CustomFullExpanded extends StatelessWidget{
  Widget child;
  CustomFullExpanded({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: child
      )
    );
  }
}