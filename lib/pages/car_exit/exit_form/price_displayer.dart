import 'package:anthony_parking/assets/themes/theme_colors.dart';
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
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.25,
      child: ColoredBox(
        color: ThemeColors.beige,
        child: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: Center(
            child: RichText(
              text: TextSpan(
                text: "R\$",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ThemeColors.dark_brown,
                  fontWeight: FontWeight.w700
                ),
                children: [
                  TextSpan(
                    text: price_formatter.format(widget.price),
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: ThemeColors.dark_brown
                    ),
                  )
                ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}