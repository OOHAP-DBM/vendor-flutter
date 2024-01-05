import 'package:flutter_bloc/flutter_bloc.dart';

enum SplashState { initial, loading }

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashState.initial) {
    /*void loadingSplash() {
      emit(SplashState.loading);
    }

    void navigateToOnboarding() {
      emit(SplashState.onboarding);
    }*/

    emit(SplashState.loading);
  }
}
