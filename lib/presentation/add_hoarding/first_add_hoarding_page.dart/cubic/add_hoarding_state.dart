abstract class AddHoardingState{}

class AddHoardingInitialState extends AddHoardingState{}

class AddHoardingInvalidState extends AddHoardingState{}

class AddHoardingValidState extends AddHoardingState{}

class AddHoardingErrorState extends AddHoardingState{
  final String errorMessage;
  AddHoardingErrorState(this.errorMessage);
}

class AddHoardingLoadingState extends AddHoardingState{}