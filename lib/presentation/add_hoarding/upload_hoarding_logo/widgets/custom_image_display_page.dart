import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oohapp/core/app_export.dart';
import 'package:oohapp/presentation/add_hoarding/upload_hoarding_logo/widgets/cubit/cubit.dart';
import 'package:oohapp/presentation/add_hoarding/upload_hoarding_logo/widgets/custom_logo_entry_text_formfield.dart';

class ImageDisplayContainer extends StatefulWidget {
  final File image;
  final VoidCallback onClose;

  const ImageDisplayContainer({
    Key? key,
    required this.image,
    required this.onClose,
  }) : super(key: key);

  @override
  _ImageDisplayContainerState createState() => _ImageDisplayContainerState();
}

class _ImageDisplayContainerState extends State<ImageDisplayContainer> {
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

  bool loading = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          Navigator.pop(context);
          loading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            DottedBorder(
              color: Colors.grey,
              borderType: BorderType.RRect,
              radius: Radius.circular(12),
              padding: EdgeInsets.all(6),
              dashPattern: [8, 4],
              strokeWidth: 2,
              child: Container(
                width: double.infinity,
                height: 167,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  image: DecorationImage(
                    image: FileImage(widget.image),
                    fit: BoxFit.cover,
                    colorFilter: loading
                        ? ColorFilter.mode(
                            Colors.black.withOpacity(0.5),
                            BlendMode.darken,
                          )
                        : null,
                  ),
                ),
                child: loading
                    ? Center(child: CircularProgressIndicator())
                    : SizedBox.shrink(),
              ),
            ),
            // Close button
            Positioned(
              right: 8,
              top: 8,
              child: IconButton(
                icon: Icon(Icons.close, color: Colors.grey),
                onPressed: widget.onClose,
              ),
            ),
          ],
        ),
        CustomLogoEntryTextFormField(
          text: 'Enter logo name',
             onPressed: () => _showImageSourceActionSheet(context),
        ),
      ],
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
