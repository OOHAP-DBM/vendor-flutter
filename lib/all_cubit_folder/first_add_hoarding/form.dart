class AddHoardingFormState {
  final String gstinno;
  final String businesstype;
  final String businessname;
  final String address;
  final String pincode;
  final String city;
  final String state;
  final String country;

  // Dropdown
  final String stateDropdown;
  final String countryDropdown;
  final String cityDropdown;
  // Validation flags
  final bool isgstinValid;
  final bool isbusinesstypeValid;
  final bool isbusinessnameValid;
  final bool isaddressValid;
  final bool ispincodeValid;
  final bool iscityValid;
  final bool isstateValid;
  final bool isCountryValid;
  final bool ispagevalid;

  const AddHoardingFormState({
    this.gstinno = '',
    this.businesstype = '',
    this.businessname = '',
    this.address = '',
    this.pincode = '',
    this.city = '',
    this.state = '',
    this.country = '',
    this.stateDropdown = '',
    this.countryDropdown = '',
    this.cityDropdown = '',
    this.isgstinValid = false,
    this.isbusinesstypeValid = false,
    this.isbusinessnameValid = false,
    this.isaddressValid = false,
    this.ispincodeValid = false,
    this.iscityValid = false,
    this.isstateValid = false,
    this.isCountryValid = false,
    this.ispagevalid=false,
  });

  AddHoardingFormState copyWith({
    String? gstinno,
    String? businesstype,
    String? businessname,
    String? address,
    String? pincode,
    String? city,
    String? state,
    String? country,
    String? stateDropdown,
    String? countryDropdown,
    String? cityDropdown,
    bool? isgstinValid,
    bool? isbusinesstypeValid,
    bool? isbusinessnameValid,
    bool? isaddressValid,
    bool? ispincodeValid,
    bool? iscityValid,
    bool? isstateValid,
    bool? isCountryValid,
    bool? ispagevalid,
  }) {
    return AddHoardingFormState(
      gstinno: gstinno ?? this.gstinno,
      businesstype: businesstype ?? this.businesstype,
      businessname: businessname ?? this.businessname,
      address: address ?? this.address,
      pincode: pincode ?? this.pincode,
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ?? this.country,
      stateDropdown: stateDropdown ?? this.stateDropdown,
      countryDropdown: countryDropdown ?? this.countryDropdown,
      cityDropdown: cityDropdown ?? this.cityDropdown,
      isgstinValid: isgstinValid ?? this.isgstinValid,
      isbusinesstypeValid: isbusinesstypeValid ?? this.isbusinesstypeValid,
      isbusinessnameValid: isbusinessnameValid ?? this.isbusinessnameValid,
      isaddressValid: isaddressValid ?? this.isaddressValid,
      ispincodeValid: ispincodeValid ?? this.ispincodeValid,
      iscityValid: iscityValid ?? this.iscityValid,
      isstateValid: isstateValid ?? this.isstateValid,
      isCountryValid: isCountryValid ?? this.isCountryValid,
      ispagevalid: ispagevalid??this.ispagevalid,
    );
  }
}
