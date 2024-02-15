import 'package:anthony_parking/components/ImageLoader/index.dart';
import 'package:anthony_parking/components/custom_widgets/custom_column.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CameraFormLayout extends StatelessWidget {
  
  List<Widget> children;
  bool allow_image_change;
  CameraFormLayout({
    required this.children,
    required this.allow_image_change,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImageLoader(
          allow_image_change: allow_image_change
        ),
        const Gap(48),
        Expanded(
          child: CustomColumn(
            gap_size: 16,
            main_alignment: MainAxisAlignment.spaceBetween,
            children: children
          )
        )
      ],
    );
  }
}