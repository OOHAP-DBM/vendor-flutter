class FirstLocationEntryFormState {
  final String hoardingaddress;
  final String pincode;
  final String city;
  final String state;
  final String country;
  final String landmark;
  final String latitude;
  final String longitude;

  // Validation checks
  final bool ishoardingaddressvalid;
  final bool ispincodevalid;
  final bool iscityvalid;
  final bool isstatevalid;
  final bool iscountryvalid;
  final bool islandmarkvalid;
  final bool islatitudevalid;
  final bool islongitudevalid;
  final bool islocationvalid;

  const FirstLocationEntryFormState({
    this.hoardingaddress = '',
    this.pincode = '',
    this.city = '',
    this.state = '',
    this.country = '',
    this.landmark = '',
    this.latitude ='',
    this.longitude ='',
    this.ishoardingaddressvalid = false,
    this.ispincodevalid = false,
    this.iscityvalid = false,
    this.isstatevalid = false,
    this.iscountryvalid = false,
    this.islandmarkvalid = false,
    this.islatitudevalid = false,
    this.islongitudevalid = false,
    this.islocationvalid = false,
  });

  FirstLocationEntryFormState copyWith({
    String? hoardingaddress,
    String? pincode,
    String? city,
    String? state,
    String? country,
    String? landmark,
    String? latitude,
    String? longitude,
    bool? ishoardingaddressvalid,
    bool? ispincodevalid,
    bool? iscityvalid,
    bool? isstatevalid,
    bool? iscountryvalid,
    bool? islandmarkvalid,
    bool? islatitudevalid,
    bool? islongitudevalid,
    bool? islocationvalid,
  }) {
    return FirstLocationEntryFormState(
      hoardingaddress: hoardingaddress ?? this.hoardingaddress,
      pincode: pincode ?? this.pincode,
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ?? this.country,
      landmark: landmark ?? this.landmark,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      ishoardingaddressvalid: ishoardingaddressvalid ?? this.ishoardingaddressvalid,
      ispincodevalid: ispincodevalid ?? this.ispincodevalid,
      iscityvalid: iscityvalid ?? this.iscityvalid,
      isstatevalid: isstatevalid ?? this.isstatevalid,
      iscountryvalid: iscountryvalid ?? this.iscountryvalid,
      islandmarkvalid: islandmarkvalid ?? this.islandmarkvalid,
      islatitudevalid: islatitudevalid ?? this.islatitudevalid,
      islongitudevalid: islongitudevalid ?? this.islongitudevalid,
      islocationvalid: islocationvalid ?? this.islocationvalid,
    );
  }
}
