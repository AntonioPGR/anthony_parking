import 'package:anthony_parking/assets/themes/theme_colors.dart';
import 'package:anthony_parking/assets/themes/theme_texts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PriceDisplayer extends StatefulWidget{
  final double price;
  const PriceDisplayer({
    required this.price,
    super.key
  });

  @override
  State<PriceDisplayer> createState() => _PriceDisplayerState();
}

class _PriceDisplayerState extends State<PriceDisplayer> {
  final price_formatter = NumberFormat("#,##0.00", "pt_BR");

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeColors.beige,
      padding: const EdgeInsets.only(top: 16, bottom: 16, left: 32, right: 32),
      child: Center(
        child: RichText(
          text: TextSpan(
            text: "R\$",
            style: ThemeText.bodySmall(color: ThemeColors.dark_brown,).copyWith(
              fontWeight: FontWeight.bold
            ),
            children: [
              TextSpan(
                text: price_formatter.format(widget.price),
                style: ThemeText.extraLarge(),
              )
            ]
          ),
        ),
      ),
    );
  }
}