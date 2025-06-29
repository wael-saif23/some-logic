import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  XFile? _image;

  Future<void> _uploadImage() async {
    ImagePicker imagePicker = ImagePicker();
    final uploadImages = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      _image = uploadImages;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[700],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 300,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  border: Border.all(color: Colors.white, width: 3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child:
                    _image == null
                        ? null
                        : Image.file(File(_image!.path), fit: BoxFit.cover),
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: _uploadImage, child: Text("Upload")),
              SizedBox(height: 8),
              if (_image != null)
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _image = null;
                    });
                  },
                  child: Text("Remove"),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
