
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:oohapp/presentation/add_hoarding/upload_hoarding_logo/upload_hoarding_video/cubit/cubit.dart';
import 'package:oohapp/presentation/add_hoarding/upload_hoarding_logo/upload_hoarding_video/cubit/cubit_data_model.dart';
import 'package:oohapp/presentation/add_hoarding/upload_hoarding_logo/upload_hoarding_video/widget/video_dispaly_container.dart';
import 'package:oohapp/presentation/add_hoarding/upload_hoarding_logo/widgets/custom_image_uploader_form.dart';


import '../../../../core/app_export.dart';

class UploadHoardingVideoPage extends StatefulWidget {
  const UploadHoardingVideoPage({super.key});

  @override
  State<UploadHoardingVideoPage> createState() =>
      _UploadHoardingVideoPageState();
}

class _UploadHoardingVideoPageState extends State<UploadHoardingVideoPage> {
  File? _video;
  Future<void> _pickVideo() async {
   
    final ImagePicker _picker=ImagePicker();
    showModalBottomSheet(
        context: context,
        builder: (BuildContext upperSheetContext) {
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
                      Navigator.of(upperSheetContext)
                          .pop(); // Close the modal bottom sheet.
                      _setvideo(File(pickedFile
                          .path));
                    }
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () async {
                    final pickedFile =
                        await _picker.pickVideo(source: ImageSource.camera);
                    if (pickedFile != null) {
                      Navigator.of(upperSheetContext).pop();
                      _setvideo(File(pickedFile.path));
                    }
                  },
                ),
              ],
            ),
          );
        });
  }

void _setvideo(File video) {
    if (!mounted) return;
    BlocProvider.of<MediaCubit>(context).addvideo(video);
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
          child: CircularButton(
            onTap: () {
              Navigator.pop(context);
            },
            backgroundColor: CustomColors.grey,
            borderColor: CustomColors.transparent,
            icon: Icons.arrow_back,
            iconColor: CustomColors.blackColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text(
              'Let’s add hoarding videos and video\nof your hoarding',
              style: TextStyle(
                color: Color(0xFF282C3E),
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              'You can upload upto 10 Brand logos',
              style: TextStyle(
                color: Color(0xFF999999),
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            BlocBuilder<MediaCubit, MediaData>(
              builder: (context, mediaData) {
                List<File> videos = mediaData.videos;
                MediaState state = mediaData.state;

                if (state == MediaState.loading) {
                  return Container(
                    height: 54,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFECFFE9),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Visibility(
                            // if visibility is true, the child
                            // widget will show otherwise hide
                            visible: true,
                            child: Icon(
                              Icons.verified_rounded,
                              color: Colors.green,
                              size: 16,
                            ),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          Text(
                            '${videos.length}media files are uploading',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Color(0xFF282C3E),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          Container(
                            width: 20,
                            height: 20,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(),
                            child: const Stack(
                                children: [Icon(Icons.media_bluetooth_off)]),
                          ),
                          Text(
                            '${videos.length}/10',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Color(0xFF282C3E),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                } else if (state == MediaState.loaded) {
                  return Container(
                    height: 54,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFECFFE9),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Visibility(
                
                            visible: true,
                            child: Icon(
                              Icons.verified_rounded,
                              color: Colors.green,
                              size: 16,
                            ),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          const Text(
                            'Uploaded Succesfully',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF282C3E),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          Container(
                            width: 20,
                            height: 20,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(),
                            child: const Stack(
                                children: [Icon(Icons.media_bluetooth_off)]),
                          ),
                          Text(
                            '${videos.length}/10',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Color(0xFF282C3E),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                } else {
                  return Container(); // Handle other states or show nothing
                }
              },
            ),
            const SizedBox(
              height: 12,
            ),
            CustomImageUploaderContainer(
              text: 'Upload Brand logo',
              onPressed: () => _showVideoSourceActionSheet(context),
            ),
            const SizedBox(
              height: 16,
            ),
            ImageGridView(),
            const SizedBox(
              height: 32,
            ),
            BlocBuilder<MediaCubit, MediaData>(
              builder: (context, MediaData) {
                List<File> videos = MediaData.videos;

                return CustomButton(
                  onTap: () {
                    Navigator.pushNamed(
                        context, Routes.uploadhoardingcalendarpage);
                  },
                  text: 'Continue',
                  backgroundColor: videos.isEmpty
                      ? const Color(0xFFDDDDDD)
                      : const Color(0xFF282C3E),
                );
              },
            )
          ]),
        ),
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
                    'Upload Brand videos',
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
                    decoration: const BoxDecoration(color: Colors.white),
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
                              const Text(
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
                            decoration: const ShapeDecoration(
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
                              const Text(
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