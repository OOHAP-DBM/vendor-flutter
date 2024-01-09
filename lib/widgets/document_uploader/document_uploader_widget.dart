import 'dart:io';
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
                        _setImage(File(pickedFile.path));
                      }
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () async {
                    final pickedFile =
                        await _picker.pickImage(source: ImageSource.camera);
                    if (pickedFile != null) {
                      _setImage(File(pickedFile.path));
                    }
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  void _setImage(File image) {
    setState(() {
      _image = image;
    });
    widget.onFileSelected(image);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _pickImage,
      child: Container(
        width: 343,
        height: 185,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFF1E1B18)),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: _image == null
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
                  Image.file(_image!, fit: BoxFit.cover),
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
    );
  }
}
