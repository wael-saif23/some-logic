import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class UploadFiles extends StatefulWidget {
  const UploadFiles({super.key});

  @override
  State<UploadFiles> createState() => _UploadFilesState();
}

class _UploadFilesState extends State<UploadFiles> {
  String? _selectedFilePath;
  String? _selectedFileName;
  bool _isShowingFilePicker = false;
  Future<void> _uploadFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'docx', 'txt'], // Specify allowed file types
      dialogTitle: 'Select a file',
      allowCompression: true, // Optional: Enable compression for large files
    );
    if (result == null) {
      return; // User canceled the picker
    }
    File file = File(result.files.single.path!);
    setState(() {
      _selectedFilePath = file.path;
      _selectedFileName = result.files.single.name;
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    border: Border.all(color: Colors.black, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.document_scanner,
                            color: Colors.black,
                            size: 30,
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 200,
                                child: Text(
                                  _selectedFileName ?? 'No files selected',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: false,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                              ),

                              Text(
                                'Typefile: .pdf, .docx, .txt',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          PopupMenuButton(
                            itemBuilder: (context) {
                              return [
                                // Upload File
                                PopupMenuItem(
                                  child: popupItem(
                                    onPressed: _uploadFiles,
                                    title: 'Upload File',
                                    icon: Icons.upload_file,
                                  ),
                                ),
                                // View File
                                PopupMenuItem(
                                  child: popupItem(
                                    onPressed: () {
                                      _isShowingFilePicker != true
                                          ? _isShowingFilePicker = true
                                          : _isShowingFilePicker = false;
                                      setState(() {});
                                      Navigator.pop(context);
                                    },
                                    title:
                                        _isShowingFilePicker
                                            ? 'View File'
                                            : "Hide File",
                                    icon:
                                        _isShowingFilePicker
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                  ),
                                ),
                                // change File
                                PopupMenuItem(
                                  child: popupItem(
                                    onPressed: () {
                                      _isShowingFilePicker = false;
                                      _uploadFiles();
                                      Navigator.pop(context);
                                    },
                                    title: 'Change File',
                                    icon: Icons.change_circle,
                                  ),
                                ),
                                // Delete File
                                PopupMenuItem(
                                  child: popupItem(
                                    onPressed: () {
                                      setState(() {
                                        _isShowingFilePicker = false;
                                        _selectedFilePath = null;
                                        _selectedFileName = null;
                                      });
                                      Navigator.pop(context);
                                    },
                                    title: 'Delete File',
                                    icon: Icons.delete,
                                    iconColor: Colors.red,
                                    textColor: Colors.red,
                                  ),
                                ),
                              ];
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // view selected file
                _selectedFilePath != null
                    ? Text(
                      'Selected File: $_selectedFileName',
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    )
                    : Text(
                      'No file selected',
                      style: TextStyle(color: Colors.black54, fontSize: 16),
                    ),
                SizedBox(
                  width: 350,
                  height: 500,
                  child:
                      _selectedFilePath != null && _isShowingFilePicker != true
                          ? SfPdfViewer.file(
                            File(_selectedFilePath ?? ''),
                            canShowScrollHead: false,
                            canShowScrollStatus: false,
                            enableDoubleTapZooming: true,
                            enableDocumentLinkAnnotation: true,
                            enableTextSelection: true,
                            pageSpacing: 0.0,
                          )
                          : SizedBox.shrink(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector popupItem({
    required void Function()? onPressed,
    required String title,
    required IconData icon,
    Color iconColor = Colors.black,
    Color textColor = Colors.black,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 20),
          SizedBox(width: 10),
          Text(title, style: TextStyle(color: textColor, fontSize: 12)),
        ],
      ),
    );
  }
}
