import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';

enum ImageState {
  initial,
  loading,
  error,
  valid,
}

class ImageCubit extends Cubit<ImageState> {
  ImageCubit() : super(ImageState.initial);

  void setImage(File? image) {
    emit(ImageState.loading);


    Future.delayed(Duration(seconds: 2), () {
      if (image != null) {
        emit(ImageState.valid);
      } else {
        emit(ImageState.error);
      }
    });
  }
}
