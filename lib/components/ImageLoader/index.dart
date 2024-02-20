import 'dart:io';
import 'package:anthony_parking/components/custom_widgets/custom_column.dart';
import 'package:anthony_parking/components/custom_widgets/custom_row.dart';
import 'package:anthony_parking/components/buttons/Button.dart';
import 'package:anthony_parking/tools/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageLoader extends StatefulWidget {
  final Function(XFile? image)? onImageChange;
  final bool allow_image_change;
  final String? initial_image_path;
  const ImageLoader({
    super.key,
    required this.allow_image_change,
    this.initial_image_path,
    this.onImageChange,
  });

  @override
  State<ImageLoader> createState() => _ImageLoaderState();
}

class _ImageLoaderState extends State<ImageLoader> {
  XFile? image;
  final PhotoPicker photo_picker = PhotoPicker();

  renderImage() {
    if (image != null) {
      return Image.file(File(image!.path));
    }
    return Image.asset("./lib/assets/images/no_image_available.png");
  }

  setImage(XFile? new_image) {
    image = new_image;
    if (widget.onImageChange != null) {
      widget.onImageChange!(new_image);
    }
    setState(() {});
  }

  void setInitialImage(){
    String? initial_path = widget.initial_image_path;
    if (initial_path != null && initial_path.isNotEmpty ) {
      File(initial_path).exists()
        .then((value){
          image = XFile(initial_path);
          setState((){});
        });
    }
  }

  void pickFromCamera() async {
    XFile? new_image = await photo_picker.pickFromCamera();
    setImage(new_image);
  }

  void pickFromGallery() async {
    XFile? new_image = await photo_picker.pickFromGallery();
    setImage(new_image);
  }

  void clean() async {
    XFile? new_image;
    setImage(new_image);
  } 

  List<Widget> renderComponents() {
    List<Widget> widgets = [
      Expanded(child: renderImage()),
    ];
    if (widget.allow_image_change == true) {
      widgets.add(
        CustomColumn(
          gap_size: 16,
          children: [
            CustomRow(
              gap_size: 8,
              children: [
                Expanded(
                  child: Button(
                    label: "Galeria",
                    on_press: pickFromGallery
                  )
                ),
                Expanded(
                  child: Button(
                    label: "Camera",
                    on_press: pickFromCamera
                  )
                )
              ]
            ),
            Button(
              label: "Limpar",
              on_press: clean
            ),
          ]
        )
      );
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    setInitialImage();

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: 350,
      child: CustomColumn(
        gap_size: 16,
        children: renderComponents(),
      ),
    );
  }

}
