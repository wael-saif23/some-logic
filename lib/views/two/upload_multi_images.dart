import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UploadMultiImages extends StatefulWidget {
  const UploadMultiImages({super.key});

  @override
  State<UploadMultiImages> createState() => _UploadMultiImagesState();
}

class _UploadMultiImagesState extends State<UploadMultiImages> {
  final List<XFile?> _images = [null, null, null];

  Future<void> _uploadImages() async {
    ImagePicker imagePicker = ImagePicker();
    final List<XFile?> selectedImages = await imagePicker.pickMultiImage(
      limit: 3,
    );
    if (selectedImages.isEmpty) {
      return;
    }

    setState(() {
      for (int i = 0; i < 3; i++) {
        _images[i] = i<selectedImages.length? selectedImages[i]: null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[700],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(_images.length, (index) {
                    final image = _images[index];
                    return Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        border: Border.all(color: Colors.white, width: 3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child:
                          image != null
                              ? Image.file(
                                File(image.path),
                                fit: BoxFit.cover,
                              )
                              : SizedBox.shrink(),
                    );
                  }),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _uploadImages();
                },
                child: Text("Select Images"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
