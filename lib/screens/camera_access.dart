import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class CameraAccess extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CameraAccessState();
  }
}

class CameraAccessState extends State<CameraAccess> {
  File cameraFile;

  @override
  Widget build(BuildContext context) {
    //display image selected from gallery
    selectFromCamera() async {
      ImagePicker imagePicker = ImagePicker();
      cameraFile = (await imagePicker.getImage(
        source: ImageSource.camera,
      )) as File;

      // cameraFile=await ImagePicker.pickImage(
      //   source: ImageSource.camera,
      // // maxHeight: 50.0,
      // maxWidth: 50.0,
      // );
      setState(() {});
    }

    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Camera Access"),
      //   backgroundColor: Colors.green,
      // ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue[800],
              Colors.blue[200],
            ],
          ),
        ),
        child: Builder(
          builder: (BuildContext context) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                      child: Text(
                        'Select Image from Camera',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w400),
                      ),
                      onPressed: selectFromCamera),
                  SizedBox(
                    height: 200.0,
                    width: 300.0,
                    child: cameraFile == null
                        ? Center(
                            child: Text(
                              'Sorry nothing selected!!',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w400),
                            ),
                          )
                        : Center(child: Image.file(cameraFile)),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
