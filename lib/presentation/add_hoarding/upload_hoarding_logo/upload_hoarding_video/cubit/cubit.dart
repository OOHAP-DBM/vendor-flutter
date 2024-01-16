import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oohapp/presentation/add_hoarding/upload_hoarding_logo/upload_hoarding_video/cubit/cubit_data_model.dart';
import 'dart:io';



enum MediaState {
  initial,
  loading,
  loaded,
  error,
}

class MediaCubit extends Cubit<MediaData> {
  MediaCubit() : super(MediaData(videos: [], state: MediaState.initial));

  void addvideo(File video) {
    // Set state to loading when a new video is being added.
    emit(MediaData(videos: state.videos, state: MediaState.loading));

    // Simulate a delay for loading the video (can replace this with actual upload logic).
    Future.delayed(Duration(seconds: 2), () {
      final newvideos = List<File>.from(state.videos)..add(video);
      emit(MediaData(videos: newvideos, state: MediaState.loaded));
    });
  }

  void removeVideo(File video) {
    final newvideos = List<File>.from(state.videos)..remove(video);
    emit(MediaData(videos: newvideos, state: MediaState.loaded));
  }
  void swapvideos(int index) {
    if (state.videos.isEmpty || index < 1 || index >= state.videos.length) return;

    // Swap the tapped video with the first video
    final List<File> newvideos = List<File>.from(state.videos);
    final File temp = newvideos[0];
    newvideos[0] = newvideos[index];
    newvideos[index] = temp;

    emit(MediaData(videos: newvideos, state: MediaState.loaded));
  }
}