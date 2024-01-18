class FinalFirstAddHoardingFirstFormState {
  final String categories;
  final String hoardingtitle;
  final String hoardingdescription;
  final String measurementlength;
  final String hoardingwidth;
  final String hoardingheight;

  // Validation checks
  final bool iscategoriesvalid;
  final bool ishoardingtitlevalid;
  final bool ishoardingdescriptionvalid;
  final bool ismeasurementlengthvalid;
  final bool ishoardingwidthvalid;
  final bool ishoardingheightvalid;
  final bool isfirstfinalhoardingvalid;

  const FinalFirstAddHoardingFirstFormState({
    this.categories = '',
    this.hoardingtitle = '',
    this.hoardingdescription = '',
    this.measurementlength = '',
    this.hoardingwidth = '',
    this.hoardingheight = '',
    this.iscategoriesvalid = false,
    this.ishoardingtitlevalid = false,
    this.ishoardingdescriptionvalid = false,
    this.ismeasurementlengthvalid = false,
    this.ishoardingwidthvalid = false,
    this.ishoardingheightvalid = false,
    this.isfirstfinalhoardingvalid=false,
  });

  FinalFirstAddHoardingFirstFormState copyWith({
    String? categories,
    String? hoardingtitle,
    String? hoardingdescription,
    String? measurementlength,
    String? hoardingwidth,
    String? hoardingheight,
    bool? iscategoriesvalid,
    bool? ishoardingtitlevalid,
    bool? ishoardingdescriptionvalid,
    bool? ismeasurementlengthvalid,
    bool? ishoardingwidthvalid,
    bool? ishoardingheightvalid,
    bool? isfirstfinalhoardingvalid,
  }) {
    return FinalFirstAddHoardingFirstFormState(
      categories: categories ?? this.categories,
      hoardingtitle: hoardingtitle ?? this.hoardingtitle,
      hoardingdescription: hoardingdescription ?? this.hoardingdescription,
      measurementlength: measurementlength ?? this.measurementlength,
      hoardingwidth: hoardingwidth ?? this.hoardingwidth,
      hoardingheight: hoardingheight ?? this.hoardingheight,
      iscategoriesvalid: iscategoriesvalid ?? this.iscategoriesvalid,
      ishoardingtitlevalid: ishoardingtitlevalid ?? this.ishoardingtitlevalid,
      ishoardingdescriptionvalid: ishoardingdescriptionvalid ?? this.ishoardingdescriptionvalid,
      ismeasurementlengthvalid: ismeasurementlengthvalid ?? this.ismeasurementlengthvalid,
      ishoardingwidthvalid: ishoardingwidthvalid ?? this.ishoardingwidthvalid,
      ishoardingheightvalid: ishoardingheightvalid ?? this.ishoardingheightvalid,
      isfirstfinalhoardingvalid: isfirstfinalhoardingvalid??this.isfirstfinalhoardingvalid,
    );
  }
}
