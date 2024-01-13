import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oohapp/presentation/add_hoarding/upload_hoarding_logo/upload_hoarding_video/cubit/cubit_data_model.dart';

class MediaCubit extends Cubit<MediaData> {
  MediaCubit() : super(MediaData(mediaFiles: [], state: MediaState.initial));

  void addMedia(File mediaFile, String type) {
    // Start with a loading state if needed
    emit(MediaData(mediaFiles: state.mediaFiles, state: MediaState.loading));

    try {
      final newMediaFile = MediaFile(file: mediaFile, type: type);
      final newMediaFiles = List<MediaFile>.from(state.mediaFiles)..add(newMediaFile);
      emit(MediaData(mediaFiles: newMediaFiles, state: MediaState.loaded));
    } catch (e) {
      // Emit error state if there's an exception
      emit(MediaData(mediaFiles: state.mediaFiles, state: MediaState.error));
    }
  }

  void removeMedia(MediaFile mediaFile) {
    emit(MediaData(mediaFiles: state.mediaFiles, state: MediaState.loading));

    try {
      final newMediaFiles = List<MediaFile>.from(state.mediaFiles)..remove(mediaFile);
      emit(MediaData(mediaFiles: newMediaFiles, state: MediaState.loaded));
    } catch (e) {
      emit(MediaData(mediaFiles: state.mediaFiles, state: MediaState.error));
    }
  }
}
