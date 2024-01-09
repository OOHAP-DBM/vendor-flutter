import 'package:oohapp/core/app_export.dart';

import 'package:oohapp/presentation/add_hoarding/second_hoarding_page/cubic/second_hoarding_event.dart';
import 'package:oohapp/presentation/add_hoarding/second_hoarding_page/cubic/second_hoarding_state.dart';

class SecondHoardingBloc extends Bloc<SecondHoardingEvent,SecondHoardingState>{
  SecondHoardingBloc():super(SecondHoardingInitialState()){
    on<SecondHoardingTextChangedEvent>((event,emit){
      if(event.accountnumber==""||event.bankholdername==""||event.bankname==""||event.ifsccode==""||event.documentFile==null){
        emit(SecondHoardingErrorState("Please fill all the fields and upload the document."));
      }
    });
    on<SaveSubmittedEvent>((event,emit){
      emit(SecondHoardingLoadingState());
    });
  }
}