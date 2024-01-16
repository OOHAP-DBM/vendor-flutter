class MediaDataModel {
  List<MediaItem> images;

  MediaDataModel(this.images);
}


class MediaItem {
  String path;
  bool isVideo;

  MediaItem(this.path, {this.isVideo = false});
}