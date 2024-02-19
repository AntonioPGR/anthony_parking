import 'package:anthony_parking/components/titles/page_title.dart';
import 'package:anthony_parking/layouts/camera_column_layout.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';

class CameraTitleLayout extends StatelessWidget{
  final bool allow_image_change;
  final String? initial_image_path;
  final Function(XFile?)? onImageChange;
  final String page_title;
  final List<Widget> between_widgets;
  const CameraTitleLayout({
    super.key,
    required this.allow_image_change,
    this.initial_image_path,
    this.onImageChange,
    required this.page_title,
    required this.between_widgets,
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
      ], 
    );
  }
}