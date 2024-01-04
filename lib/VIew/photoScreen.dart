import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoScreen extends StatefulWidget {
  static String id = '/PhotoScreen';

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  final ImagePicker picker = ImagePicker();
  XFile? _image; //이미지를 담을 변수 선언

  Future getImage(ImageSource imageSource) async {
    //pickedFile에 ImagePicker로 가져온 이미지가 담긴다.
    final XFile? pickedFile = await picker.pickImage(source: imageSource);
    if (pickedFile != null) {
      setState(() {
        _image = XFile(pickedFile.path); //가져온 이미지를 _image에 저장
      });
    } else {
      print('pickedFile: ${pickedFile}');
      print('pickedFile name: ${pickedFile?.name}');
      print('pickedFile path: ${pickedFile?.path}');


    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  color: Colors.red,
                  child: kIsWeb
                      ?
                      // 웹에서 이미지를 불러올때
                      _image != null
                          ? Image.network(
                              _image!.path,
                              fit: BoxFit.cover,
                            )

                          : null
                      : // 모바일에서 이미지를 불러올때
                      _image != null
                          ? Image.file(
                              File(_image!.path),
                              fit: BoxFit.cover,
                            )
                          : null,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                '준비되셨나요?\n오늘의 웃음을 위해 사진을 찍어보세요!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              ElevatedButton(
                onPressed: () {
                  getImage(ImageSource.camera);
                  //Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  fixedSize:
                      Size(200.0, 50.0), // Adjust width and height as needed
                  //padding: EdgeInsets.symmetric(horizontal: 20.0), // Adjust left and right padding
                ),
                child: Text("사진 촬영"),
              ),
              SizedBox(
                height: 15.0,
              ),
              ElevatedButton(
                onPressed: () {
                  getImage(ImageSource.gallery);
                },
                style: ElevatedButton.styleFrom(
                  fixedSize:
                      Size(200.0, 50.0), // Adjust width and height as needed
                  //padding: EdgeInsets.symmetric(horizontal: 20.0), // Adjust left and right padding
                ),
                child: Text("사진첩에서 가져오기"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
