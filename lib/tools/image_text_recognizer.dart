import 'package:camera/camera.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class ImageTextRecognizer{

  final TextRecognizer detector = GoogleMlKit.vision.textRecognizer();

  Future<String?> RecognizeTextFrom(XFile image) async{
    RecognizedText recognized_text = await _processImage(image.path);
    return _getText(recognized_text);
  }

  Future<RecognizedText> _processImage(String path) async {
    InputImage input_image = InputImage.fromFilePath(path);
    RecognizedText recognized_text = await detector.processImage(input_image);
    await detector.close();
    return recognized_text;
  }

  String _getText(RecognizedText text){
    String scanned_text = "";
    for(TextBlock blocks in text.blocks){
      for(TextLine line in blocks.lines){
        scanned_text += "${line.text}\n";
      }
    }
    return scanned_text;
  }

}