import 'dart:io';

import 'package:oohapp/presentation/add_hoarding/upload_hoarding_logo/widgets/cubit/cubit.dart';

class ImageData {
  final List<File> images;
  final ImageState state;

  ImageData({required this.images, required this.state});
}
