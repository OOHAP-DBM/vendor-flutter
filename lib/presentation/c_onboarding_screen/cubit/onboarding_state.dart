part of 'onboarding_cubit.dart';

class OnboardingState {
  final int currentPageIndex;
  final bool onLastPage;
  final bool showBackButton;

  OnboardingState(
      {required this.currentPageIndex, required this.onLastPage, required this.showBackButton});

  OnboardingState copyWith(
      {int? currentPageIndex, bool? onLastPage, bool? showBackButton}) {
    return OnboardingState(
        currentPageIndex: currentPageIndex ?? this.currentPageIndex,
        onLastPage: onLastPage ?? this.onLastPage,
        showBackButton: showBackButton ?? this.showBackButton);
  }
}
