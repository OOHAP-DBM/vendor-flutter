import 'dart:io';

import 'package:oohapp/presentation/add_hoarding/upload_hoarding_logo/upload_hoarding_video/cubit/cubit.dart';
import 'package:oohapp/presentation/add_hoarding/upload_hoarding_logo/widgets/cubit/cubit.dart';

class MediaData {
  final List<File> videos;
  final MediaState state;

  MediaData({required this.videos, required this.state});
}
