import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oohapp/presentation/add_hoarding/upload_hoarding_logo/widgets/custom_image_uploader_form.dart';

import '../../../../core/app_export.dart';

class UploadHoardingVideoPage extends StatefulWidget {
  const UploadHoardingVideoPage({super.key});

  @override
  State<UploadHoardingVideoPage> createState() =>
      _UploadHoardingVideoPageState();
}

class _UploadHoardingVideoPageState extends State<UploadHoardingVideoPage> {
  List<File> _mediaFiles = [];

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _mediaFiles.add(File(pickedFile.path));
        _showMediaSheet();
      });
    }
  }

  Future<void> _pickVideo() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickVideo(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _mediaFiles.add(File(pickedFile.path));
        _showMediaSheet();
      });
    }
  }

  void _removeMedia(int index) {
    setState(() {
      _mediaFiles.removeAt(index);
    });
  }

  void _showMediaSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.75,
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                  ),
                  itemCount: _mediaFiles.length,
                  itemBuilder: (context, index) {
                    return Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Image.file(
                          _mediaFiles[index],
                          fit: BoxFit.cover,
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () => _removeMedia(index),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showMediaPicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Pick Image from Gallery'),
                onTap: () {
                  _pickImage();
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.videocam),
                title: const Text('Pick Video from Gallery'),
                onTap: () {
                  _pickVideo();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Add Hoarding',
        centerTitle: true,
        elevation: 1,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.clear),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Let’s add hoarding images and video\nof your hoarding',
                style: TextStyle(
                  color: Color(0xFF282C3E),
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                'You can upload upto 10 Brand logos',
                style: TextStyle(
                  color: Color(0xFF999999),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              CustomImageUploaderContainer(
                hintText: 'Upload brand logo',
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                          height: 67,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: 63,
                                  height: 7,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFFE4E4E4),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 24),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: _showMediaSheet,
                                      child: Container(
                                        width: 33,
                                        height: 21,
                                        child: const Icon(
                                          Icons.camera_alt_outlined,
                                          size: 31.5,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    const Text(
                                      'Photo',
                                      style: TextStyle(
                                        color: Color(0xFF999999),
                                        fontSize: 14,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ));
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
