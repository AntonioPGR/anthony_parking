import 'package:image_picker/image_picker.dart';

class PhotoPicker{

  Future<XFile?> _pickImage(ImageSource source) async{
    XFile? image = await ImagePicker().pickImage(source: source);
    return image;
  }

  Future<XFile?> pickFromGallery() async {
    return await _pickImage(ImageSource.gallery);
  }

  Future<XFile?> pickFromCamera() async {
    return await _pickImage(ImageSource.camera);
  }

}