import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';

class UploadVideo extends StatefulWidget {
  const UploadVideo({super.key});

  @override
  State<UploadVideo> createState() => _UploadVideoState();
}

class _UploadVideoState extends State<UploadVideo> {
  XFile? _video;
  VideoPlayerController? _videoController;

  @override
  void dispose() {
    if (_videoController != null) {
      _videoController!.dispose();
    }
    super.dispose();
  }

  Future<void> _uploadVideo() async {
    XFile? pickedVedio = await ImagePicker().pickVideo(
      source: ImageSource.gallery,
    );

    if (pickedVedio == null) {
      return;
    }

    setState(() {
      _video = pickedVedio;
      _videoController = VideoPlayerController.file(File(_video!.path))
        ..initialize().then((_) {
          _videoController!.play();
          _videoController!.setLooping(true);
        });
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
              Container(
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  border: Border.all(color: Colors.white, width: 3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child:
                    _videoController != null &&
                            _videoController!.value.isInitialized
                        ? AspectRatio(
                          aspectRatio: _videoController!.value.aspectRatio,
                          child: VideoPlayer(_videoController!),
                        )
                        : Center(
                          child: Text(
                            'No video selected',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _uploadVideo,
                child: Text('Select Video'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
