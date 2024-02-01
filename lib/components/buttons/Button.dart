import 'package:anthony_parking/assets/themes/theme_colors.dart';
import 'package:flutter/material.dart';

class Button extends StatefulWidget{
  final String label;
  final Color? bg_color;
  final Color? text_color;
  final void Function() on_press;
  final double? width;
  const Button({
    required this.label,
    this.bg_color,
    this.text_color,
    required this.on_press,
    this.width,
    super.key
  });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        widget.on_press();
      },
      child: Container(
        height: 80,
        width: widget.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: widget.bg_color ?? ThemeColors.dark_brown,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Text(
            widget.label,
            style: TextStyle(
              color: widget.text_color ?? ThemeColors.off_white,
              fontSize: 24,
              fontWeight: FontWeight.w600
            ),
          ),
        )
      )
    );
  }
}