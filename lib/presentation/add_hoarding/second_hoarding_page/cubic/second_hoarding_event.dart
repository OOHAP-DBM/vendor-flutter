import 'dart:io';

abstract class SecondHoardingEvent {}

class SecondHoardingTextChangedEvent extends SecondHoardingEvent {
  final String bankname;
  final String bankholdername;
  final String accountnumber;
  final String ifsccode;
  final File documentFile; // Added File parameter

  SecondHoardingTextChangedEvent(
    this.bankname,
    this.bankholdername,
    this.accountnumber,
    this.ifsccode,
    this.documentFile, // Added File argument
  );
}

class SaveSubmittedEvent extends SecondHoardingEvent {
  final String bankname;
  final String bankholdername;
  final String accountnumber;
  final String ifsccode;
  final File documentFile; // Added File parameter

  SaveSubmittedEvent(
    this.bankname,
    this.bankholdername,
    this.accountnumber,
    this.ifsccode,
    this.documentFile, // Added File argument
  );
}
