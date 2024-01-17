class SecondHoardingFormState {
  final String bankname;
  final String accountholdername;
  final String accountnumber;
  final String ifsc;

  // Validation flags
  final bool isbanknamevalid;
  final bool isaccountholdernamevalid;
  final bool isaccountnumbervalid;
  final bool isifscvalid;
  final bool issecondvalid;

  const SecondHoardingFormState({
    this.bankname = '',
    this.accountholdername = '',
    this.accountnumber = '',
    this.ifsc = '',
    this.isbanknamevalid = false,
    this.isaccountholdernamevalid = false,
    this.isaccountnumbervalid = false,
    this.isifscvalid = false,
    this.issecondvalid=false,
  });

  SecondHoardingFormState copyWith({
    String? bankname,
    String? accountholdername,
    String? accountnumber,
    String? ifsc,
    bool? isbanknamevalid,
    bool? isaccountholdernamevalid,
    bool? isaccountnumbervalid,
    bool? isifscvalid,
    bool? issecondvalid,
  }) {
    return SecondHoardingFormState(
      bankname: bankname ?? this.bankname,
      accountholdername: accountholdername ?? this.accountholdername,
      accountnumber: accountnumber ?? this.accountnumber,
      ifsc: ifsc ?? this.ifsc,
      isbanknamevalid: isbanknamevalid ?? this.isbanknamevalid,
      isaccountholdernamevalid: isaccountholdernamevalid ?? this.isaccountholdernamevalid,
      isaccountnumbervalid: isaccountnumbervalid ?? this.isaccountnumbervalid,
      isifscvalid: isifscvalid ?? this.isifscvalid,
      issecondvalid: issecondvalid??this.issecondvalid,
    );
  }
}
