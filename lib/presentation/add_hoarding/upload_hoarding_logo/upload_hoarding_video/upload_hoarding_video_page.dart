import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oohapp/presentation/add_hoarding/upload_hoarding_logo/upload_hoarding_video/cubit/cubit.dart';
import 'package:oohapp/presentation/add_hoarding/upload_hoarding_logo/upload_hoarding_video/cubit/cubit_data_model.dart';
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

  Future<void> _pickVideo() async {
    final ImagePicker _picker = ImagePicker();
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bottomSheetContext) {
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
                      Navigator.of(bottomSheetContext)
                          .pop(); // Close the modal bottom sheet.
                      _setVideo(File(pickedFile
                          .path)); // Use _setImage which uses the correct context.
                    }
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () async {
                    final pickedFile =
                        await _picker.pickImage(source: ImageSource.camera);
                    if (pickedFile != null) {
                      Navigator.of(bottomSheetContext).pop();
                      _setVideo(File(pickedFile.path));
                    }
                  },
                ),
              ],
            ),
          );
        });
  }

  void _setVideo(File video) {
    context.read<MediaCubit>().addMedia(video, 'video');
    _showMediaSheet();
  }

  void _removeMedia(int index) {
    setState(() {
      _mediaFiles.removeAt(index);
    });
  }

  void _showMediaSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bottomSheetcontext) {
        return Builder(
          builder: (contextWithMediaCubit) {
            return BlocBuilder<MediaCubit, MediaData>(
              builder: (context, state) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.75,
                  child: Column(
                    children: [
                      Expanded(
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 4,
                            mainAxisSpacing: 4,
                          ),
                          itemCount: state.mediaFiles.length,
                          itemBuilder: (context, index) {
                            final mediaFile = state.mediaFiles[index];
                            return Stack(
                              alignment: Alignment.topRight,
                              children: [
                                mediaFile.type == 'video'
                                    ? // Show video thumbnail or placeholder
                                    Container(
                                        decoration: BoxDecoration(
                                          color: Colors.black, // Placeholder color
                                        ),
                                        child: Icon(Icons.play_circle_outline,
                                            color:
                                                Colors.white), // Play icon overlay
                                      )
                                    : Image.file(
                                        mediaFile.file,
                                        fit: BoxFit.cover,
                                      ),
                                IconButton(
                                  icon: Icon(Icons.close),
                                  onPressed: () => context
                                      .read<MediaCubit>()
                                      .removeMedia(mediaFile),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      // Add buttons for Image and Video at the bottom of the sheet
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton.icon(
                            icon: Icon(Icons.image),
                            label: Text('Image'),
                            onPressed:
                                _pickVideo, // Implement _pickImage similarly to _pickVideo
                          ),
                          ElevatedButton.icon(
                            icon: Icon(Icons.video_call),
                            label: Text('Video'),
                            onPressed: _pickVideo,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          }
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MediaCubit(),
      child: Builder(
        builder:(context) {
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
                    text: 'Upload brand logo',
                    onPressed: () => _showVideoSourceActionSheet(context),
                  ),
                  CustomButton(
                    onTap: () {},
                    text: 'Continue',
                  )
                ],
              ),
            ),
          ),
        );
        }
      ),
    );
  }

  void _showVideoSourceActionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
            height: 180,
            child: Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 75,
                    height: 7,
                    decoration: ShapeDecoration(
                      color: const Color(0xFFE4E4E4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Upload Brand Images',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF282C3E),
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    width: 343,
                    decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Color(0xFFE0E0E0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    width: 375,
                    height: 72.75,
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    decoration: BoxDecoration(color: Colors.white),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: _pickVideo,
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
                              Text(
                                'Photo',
                                style: TextStyle(
                                  color: Color(0xFF999999),
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 40),
                        Transform(
                          transform: Matrix4.identity()
                            ..translate(0.0, 0.0)
                            ..rotateZ(1.57),
                          child: Container(
                            width: 24.75,
                            height: double.infinity,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: 1,
                                  strokeAlign: BorderSide.strokeAlignCenter,
                                  color: Color(0xFF282C3E),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 40),
                        Container(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: _pickVideo,
                                child: Container(
                                  width: 33,
                                  height: 21,
                                  child: const Icon(
                                    Icons.video_call,
                                    size: 31.5,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Video',
                                style: TextStyle(
                                  color: Color(0xFF999999),
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ));
      },
    );
  }
}
