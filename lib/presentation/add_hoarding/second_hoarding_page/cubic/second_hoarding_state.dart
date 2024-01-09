abstract class SecondHoardingState{}

class SecondHoardingInitialState extends SecondHoardingState{}

class SecondHoardingInvalidState extends SecondHoardingState{}

class SecondHoardingValidState extends SecondHoardingState{}

class SecondHoardingErrorState extends SecondHoardingState{
  final String errorMessage;
SecondHoardingErrorState(this.errorMessage);
}

class SecondHoardingLoadingState extends SecondHoardingState{}