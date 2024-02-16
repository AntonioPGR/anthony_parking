import 'package:anthony_parking/components/buttons/Button.dart';
import 'package:anthony_parking/components/titles/page_title.dart';
import 'package:anthony_parking/layouts/camera_column_layout.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';

class CameraTitleButtonLayout extends StatelessWidget{
  final bool allow_image_change;
  final String? initial_image_path;
  final Function(XFile?)? onImageChange;
  final String page_title;
  final List<Widget> between_widgets;
  final String button_label;
  final void Function() onSubmit;
  const CameraTitleButtonLayout({
    super.key,
    required this.allow_image_change,
    this.initial_image_path,
    this.onImageChange,
    required this.page_title,
    required this.between_widgets,
    required this.button_label,
    required this.onSubmit
  });

  @override
  Widget build(BuildContext context) {
    return CameraColumnLayout(
      allow_image_change: allow_image_change,
      initial_image_path: initial_image_path,
      onImageChange: onImageChange,
      children: [
        PageTitle(page_title),
        ...between_widgets,
        Button(
          label: button_label, 
          on_press: onSubmit
        )
      ], 
    );
  }
}