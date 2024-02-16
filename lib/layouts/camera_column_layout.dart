import 'package:anthony_parking/components/ImageLoader/index.dart';
import 'package:anthony_parking/components/custom_widgets/custom_column.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CameraColumnLayout extends StatelessWidget {
  
  List<Widget> children;
  bool allow_image_change;
  String? initial_image_path;
  Function(XFile?)? onImageChange;
  CameraColumnLayout({
    required this.children,
    required this.allow_image_change,
    this.initial_image_path,
    this.onImageChange,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ImageLoader(
          allow_image_change: allow_image_change,
          initial_image_path: initial_image_path,
          onImageChange: onImageChange,
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