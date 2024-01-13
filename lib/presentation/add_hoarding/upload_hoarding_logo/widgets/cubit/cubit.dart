import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';

import 'package:oohapp/presentation/add_hoarding/upload_hoarding_logo/widgets/cubit/cubit_state.dart';

enum ImageState {
  initial,
  loading,
  loaded,
  error,
}

class ImageCubit extends Cubit<ImageData> {
  ImageCubit() : super(ImageData(images: [], state: ImageState.initial));

  void addImage(File image) {
    // Set state to loading when a new image is being added.
    emit(ImageData(images: state.images, state: ImageState.loading));

    // Simulate a delay for loading the image (can replace this with actual upload logic).
    Future.delayed(Duration(seconds: 2), () {
      final newImages = List<File>.from(state.images)..add(image);
      emit(ImageData(images: newImages, state: ImageState.loaded));
    });
  }

  void removeImage(File image) {
    final newImages = List<File>.from(state.images)..remove(image);
    emit(ImageData(images: newImages, state: ImageState.loaded));
  }
}



