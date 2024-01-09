abstract class AddHoardingEvent{}

class AddHoardingTextChangedEvent extends AddHoardingEvent{
  final String gstinvalue;
  final String businessname;
  final String businesstype;
  final String pincode;
  final String city;
  final String state;
  final String country;

  AddHoardingTextChangedEvent(this.gstinvalue, this.businessname, this.businesstype, this.pincode, this.city, this.state, this.country);
  
}
class ContinueSubmittedEvent extends AddHoardingEvent{
    final String gstinvalue;
  final String businessname;
  final String businesstype;
  final String pincode;
  final String city;
  final String state;
  final String country;

  ContinueSubmittedEvent(this.gstinvalue, this.businessname, this.businesstype, this.pincode, this.city, this.state, this.country);
}