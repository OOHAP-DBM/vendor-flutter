import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditableImageUpload extends StatefulWidget {
  final String title;
  final List<String> allowedExtensions;
  final Function(File file) onFileSelected;

  const EditableImageUpload({
    Key? key,
    required this.title,
    required this.allowedExtensions,
    required this.onFileSelected,
  }) : super(key: key);

  @override
  _EditableImageUploadState createState() => _EditableImageUploadState();
}

class _EditableImageUploadState extends State<EditableImageUpload> {
  File? _image;
  bool _isLoading = false; // Add a loading indicator flag

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Gallery'),
                  onTap: () async {
                    final pickedFile =
                        await _picker.pickImage(source: ImageSource.gallery);
                    if (pickedFile != null) {
                      _loadImage(File(pickedFile.path));
                    }
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () async {
                    final pickedFile =
                        await _picker.pickImage(source: ImageSource.camera);
                    if (pickedFile != null) {
                      _loadImage(File(pickedFile.path));
                    }
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  Future<void> _loadImage(File image) async {
    setState(() {
      _isLoading = true; // Set loading indicator to true
    });

    // Simulate a delay to mimic image loading (remove this in your actual code)
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      _image = image;
      _isLoading = false; // Set loading indicator to false
    });

    widget.onFileSelected(image);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _pickImage,
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(12),
        padding: const EdgeInsets.all(6),
        dashPattern: [8, 4],
        strokeWidth: 2,
        color: Colors.grey.shade400,
        child: Container(
          width: double.infinity,
          height: 185,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: _isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : _image == null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.file_upload,
                          size: 28,
                        ),
                        Text(
                          widget.title,
                          style: const TextStyle(
                            color: Color(0xFF282C3E),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                        Text(
                          "(${widget.allowedExtensions.join(', ')}) Only",
                          style: const TextStyle(
                            color: Color(0xFF949291),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w300,
                            height: 0,
                          ),
                        ),
                      ],
                    )
                  : Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Center(
                          // Center-align the loaded image
                          child: Image.file(_image!, fit: BoxFit.cover),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: _pickImage,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: const Icon(
                                Icons.edit,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
        ),
      ),
    );
  }
}
