import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit()
      : super(OnboardingState(
            currentPageIndex: 0, onLastPage: false, showBackButton: false));

  void onPageChanged(int index) {
    final onLastPage = (index == 2);
    emit(state.copyWith(currentPageIndex: index, onLastPage: onLastPage));
  }

  void showBackButton(bool show) {
    emit(state.copyWith(showBackButton: show));
  }
}
