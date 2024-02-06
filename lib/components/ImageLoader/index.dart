import 'dart:io';
import 'package:anthony_parking/components/containers/widget_column.dart';
import 'package:anthony_parking/components/containers/widget_row.dart';
import 'package:anthony_parking/components/forms/buttons/Button.dart';
import 'package:anthony_parking/tools/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageLoader extends StatefulWidget{
  final Function(XFile? image)? onImageChange;
  final bool allow_image_change;
  final String? initial_image_path;
  const ImageLoader({
    super.key,
    required this.allow_image_change,
    this.initial_image_path,
    this.onImageChange,
  });

  get initial_path => initial_image_path;

  @override
  State<ImageLoader> createState() => _ImageLoaderState();
}

class _ImageLoaderState extends State<ImageLoader> {
  XFile? image;
  final PhotoPicker photo_picker = PhotoPicker();

  @override
  Widget build(BuildContext context) {
    String? initial_path = widget.initial_image_path;
    if(initial_path != null && image == null){
      image = XFile(initial_path);
    }

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: 350,
      child: WidgetColumn(
        gap_size: 16,
        widgets: renderComponents(),
      ),
    );
  }

  List<Widget> renderComponents(){
    List<Widget> widgets = [Expanded(child: renderImage()),];
    if(widget.allow_image_change == true){
      widgets.add(
        WidgetRow(
          widgets: [
            Button(label: "Galeria", on_press:() async{
              XFile? new_image = await photo_picker.pickFromGallery();
              setImage(new_image);
            }),
            Button(label: "Camera", on_press:() async{
              XFile? new_image = await photo_picker.pickFromCamera();
              setImage(new_image);
            }),
            Button(label: "Limpar", on_press:() async{
              XFile? new_image = null;
              setImage(new_image);
            }),
          ]
        )
      );
    }
    return widgets;
  }

  renderImage(){
    if(image != null){
      return Image.file(File(image!.path));
    }
    return Image.asset("./lib/assets/images/no_image_available.png");
  }

  setImage(XFile? new_image){
    image = new_image;
    if(widget.onImageChange != null){
      widget.onImageChange!(new_image);
    }
    setState(() {});
  }

}