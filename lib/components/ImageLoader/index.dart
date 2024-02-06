import 'dart:io';
import 'package:anthony_parking/components/containers/widget_column.dart';
import 'package:anthony_parking/components/containers/widget_row.dart';
import 'package:anthony_parking/components/forms/buttons/Button.dart';
import 'package:anthony_parking/tools/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

class ImagePicker extends StatefulWidget{
  const ImagePicker({super.key});

  @override
  State<ImagePicker> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  XFile? image;
  String scanned_text = "";
  final PhotoPicker photo_picker = PhotoPicker();

  @override
  Widget build(BuildContext context) {
    return WidgetColumn(
      gap_size: 16,
      widgets: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          height: MediaQuery.of(context).size.height * 0.4,
          child: renderImage()
        ),
        Text(scanned_text),
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
          ]
        )
      ],
    );
  }

  setImage(XFile? new_image){
    image = new_image;
    setState(() {});
  }

  renderImage(){
    if(image != null){
      return Image.file(File(image!.path));
    }
    return  Image.asset("./lib/assets/images/no_image_available.png");
  }

  void recognizeText(XFile image) async {
    final input_image = InputImage.fromFilePath(image.path);
    final text_detector = GoogleMlKit.vision.textRecognizer();
    RecognizedText recognized_text = await text_detector.processImage(input_image);
    await text_detector.close();
    scanned_text = "";
    for(TextBlock blocks in recognized_text.blocks){
      for(TextLine line in blocks.lines){
        scanned_text += line.text + "\n";
      }
    }
    is_scanning_text = false;
    setState(() {});
  }

}