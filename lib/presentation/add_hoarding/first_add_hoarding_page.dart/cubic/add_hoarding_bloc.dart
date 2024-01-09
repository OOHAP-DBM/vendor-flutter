import 'package:oohapp/core/app_export.dart';
import 'package:oohapp/presentation/add_hoarding/first_add_hoarding_page.dart/cubic/add_hoarding_event.dart';
import 'package:oohapp/presentation/add_hoarding/first_add_hoarding_page.dart/cubic/add_hoarding_state.dart';

class AddHoardingBloc extends Bloc<AddHoardingEvent,AddHoardingState>{
  AddHoardingBloc():super(AddHoardingInitialState()){
    on<AddHoardingTextChangedEvent>((event,emit){
      if(event.businessname==""||event.businesstype==""||event.city==""||event.country==""||event.pincode==""||event.state==""){
        emit(AddHoardingErrorState("please fill all the fields"));
      }
    });
    on<ContinueSubmittedEvent>((event,emit){
      emit(AddHoardingLoadingState());
    });
  }
}