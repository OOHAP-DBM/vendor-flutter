import 'dart:io';

import 'package:oohapp/presentation/add_hoarding/upload_hoarding_logo/upload_hoarding_video/widget/media_item_model.dart';

import '../../../../../core/app_export.dart';

// ImageTile.dart
class ImageTile extends StatelessWidget {
  final File imageFile;
  final VoidCallback onTap;
  final VoidCallback onClose;
  final double height;
  final double width;
  

  const ImageTile({
    Key? key,
    required this.imageFile,
    required this.onTap,
    required this.onClose,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          GestureDetector(
            onTap: onTap,
            child: Image.file(
              imageFile,
              fit: BoxFit.cover,
            ),
          ),
          IconButton(
            icon: Icon(Icons.close),
            onPressed: onClose,
          ),
        ],
      ),
    );
  }
}
