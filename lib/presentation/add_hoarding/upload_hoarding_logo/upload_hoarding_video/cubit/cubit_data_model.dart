import 'dart:io';

class MediaFile {
  final File file;
  final String type; // 'image' or 'video'

  MediaFile({required this.file, required this.type});
}

class MediaData {
  final List<MediaFile> mediaFiles;
  final MediaState state;

  MediaData({required this.mediaFiles, required this.state});
}

enum MediaState {
  initial,
  loading,
  loaded,
  error,
}
