import 'dart:ffi';

import 'package:flutter/cupertino.dart';

class CustomSpacer extends StatefulWidget{
  final double width;
  final double height;
  const CustomSpacer({
    Key? key,
    this.height = 16,
    this.width = 16,
  })  : super(key:key);

  @override
  State<StatefulWidget> createState() {
    return _CustomSpacer();
  }
}

class _CustomSpacer extends State<CustomSpacer>{
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
    );
  }

}