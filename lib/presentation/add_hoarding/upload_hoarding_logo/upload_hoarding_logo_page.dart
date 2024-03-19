import 'dart:io';

import 'package:image_picker/image_picker.dart';

import 'package:oohapp/presentation/add_hoarding/upload_hoarding_logo/widgets/cubit/cubit.dart';
import 'package:oohapp/presentation/add_hoarding/upload_hoarding_logo/widgets/cubit/cubit_state.dart';
import 'package:oohapp/presentation/add_hoarding/upload_hoarding_logo/widgets/custom_image_display_page.dart';
import 'package:oohapp/presentation/add_hoarding/upload_hoarding_logo/widgets/custom_image_uploader_form.dart';

import '../../../core/app_export.dart';

class UploadHoardingLogoPage extends StatefulWidget {
  const UploadHoardingLogoPage({super.key});

  @override
  State<UploadHoardingLogoPage> createState() => _UploadHoardingLogoPageState();
}

class _UploadHoardingLogoPageState extends State<UploadHoardingLogoPage> {
  File? _image;
  Future<void> _pickImage() async {
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
                      _setImage(File(pickedFile
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
                      _setImage(File(pickedFile.path));
                    }
                  },
                ),
              ],
            ),
          );
        });
  }

  void _setImage(File image) {
    if (!mounted) return;
    BlocProvider.of<ImageCubit>(context).addImage(image);
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
            onPressed: () {
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
              'Recently Booked by',
              textAlign: TextAlign.center,
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
            BlocBuilder<ImageCubit, ImageData>(
              builder: (context, imageData) {
                // Extract images and state from imageData
                List<File> images = imageData.images;
                ImageState state = imageData.state;

                // Build UI based on the state
                if (state == ImageState.loading) {
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
                            '${images.length}media files are uploading',
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
                            '${images.length}/10',
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
                } else if (state == ImageState.loaded) {
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
                            '${images.length}/10',
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
                  return Container();
                }
              },
            ),
            const SizedBox(
              height: 12,
            ),
            CustomImageUploaderContainer(
              text: 'Upload Brand logo',
              onPressed: () => _showImageSourceActionSheet(context),
            ),
            const SizedBox(
              height: 16,
            ),
            Builder(
              builder: (context) {
                return BlocBuilder<ImageCubit, ImageData>(
                  builder: (context, imageData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: imageData.images.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: ImageDisplayContainer(
                            key: ValueKey(imageData.images[index].path),
                            image: imageData.images[index],
                            onClose: () {
                              BlocProvider.of<ImageCubit>(context)
                                  .removeImage(imageData.images[index]);
                            },
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
            const SizedBox(
              height: 32,
            ),
            BlocBuilder<ImageCubit, ImageData>(
              builder: (context, imageData) {
                List<File> images = imageData.images;

                return CustomButton(
                  onTap: () {
                    Navigator.pushNamed(
                        context, Routes.uploadhoardingvideopage);
                  },
                  text: 'Continue',
                  backgroundColor: images.isEmpty
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

  void _showImageSourceActionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 180,
          width: double.infinity,
          decoration: const ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
          ),
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
                    color: Color(0xFFE4E4E4),
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
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: _pickImage,
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
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
