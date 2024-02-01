import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Camera extends StatefulWidget{
  const Camera({super.key});

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  late List<CameraDescription> cameras;
  late CameraController camera_controller;

  @override
  void initState() {
    startCamera();
    super.initState();
  }

  void startCamera() async{
    cameras = await availableCameras();
    camera_controller = CameraController(
      cameras[0],
      ResolutionPreset.medium,
      enableAudio: false,
    );
    await camera_controller.initialize()
      .then((value) => {
        if(mounted){
          setState(() {})
        }
      })
      .catchError((e) => null);
    ;
    await camera_controller.lockCaptureOrientation(DeviceOrientation.portraitUp);
  }

  @override
  void dispose(){
    camera_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    try{
      return SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height / 16 * 9,
        child: CameraPreview(
          camera_controller
        ),
      );
    } catch(e){
      return Container(
        color: Colors.black26,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height / 16 * 9,
      );
    }
  }
}