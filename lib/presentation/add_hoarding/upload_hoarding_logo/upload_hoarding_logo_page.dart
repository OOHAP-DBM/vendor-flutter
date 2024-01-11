import 'dart:io';

import 'package:image_picker/image_picker.dart';
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
              CustomImageUploaderContainer(
                hintText: 'Upload Brand logo',
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
                                    )
                                  ],
                                )
                              ],
                            ),
                          ));
                    },
                  );
                },
              ),
              SizedBox(height: 16,),
              if(_image!=null)
              ImageDisplayContainer(
                image: _image, 
                onRetry:(){} ,
              onClose: (){},)

              
            ],
          ),
        ),
      ),
    );
  }
}
