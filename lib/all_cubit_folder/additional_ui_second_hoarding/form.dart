class AdditionUISecondHoardingFormState {
  final String gst;
  final String igst;
  final String discounttype;
  final String discountpercentage;
  final String totalpricewithtax;
  final String discountedprice;

  // Validation checks
  final bool isgstvalid;
  final bool isigstvalid;
  final bool isdiscounttypevalid;
  final bool isdiscountpercentagevalid;
  final bool istotalpricewithtaxvalid;
  final bool isdiscountedpricevalid;
  final bool istaxvalid;

  const AdditionUISecondHoardingFormState({
    this.gst = '',
    this.igst = '',
    this.discounttype = '',
    this.discountpercentage = '',
    this.totalpricewithtax = '',
    this.discountedprice = '',
    this.isgstvalid = false,
    this.isigstvalid = false,
    this.isdiscounttypevalid = false,
    this.isdiscountpercentagevalid = false,
    this.istotalpricewithtaxvalid = false,
    this.isdiscountedpricevalid = false,
    this.istaxvalid=false,
  });

  AdditionUISecondHoardingFormState copyWith({
    String? gst,
    String? igst,
    String? discounttype,
    String? discountpercentage,
    String? totalpricewithtax,
    String? discountedprice,
    bool? isgstvalid,
    bool? isigstvalid,
    bool? isdiscounttypevalid,
    bool? isdiscountpercentagevalid,
    bool? istotalpricewithtaxvalid,
    bool? isdiscountedpricevalid,
    bool? istaxvalid,
  }) {
    return AdditionUISecondHoardingFormState(
      gst: gst ?? this.gst,
      igst: igst ?? this.igst,
      discounttype: discounttype ?? this.discounttype,
      discountpercentage: discountpercentage ?? this.discountpercentage,
      totalpricewithtax: totalpricewithtax ?? this.totalpricewithtax,
      discountedprice: discountedprice ?? this.discountedprice,
      isgstvalid: isgstvalid ?? this.isgstvalid,
      isigstvalid: isigstvalid ?? this.isigstvalid,
      isdiscounttypevalid: isdiscounttypevalid ?? this.isdiscounttypevalid,
      isdiscountpercentagevalid: isdiscountpercentagevalid ?? this.isdiscountpercentagevalid,
      istotalpricewithtaxvalid: istotalpricewithtaxvalid ?? this.istotalpricewithtaxvalid,
      isdiscountedpricevalid: isdiscountedpricevalid ?? this.isdiscountedpricevalid,
      istaxvalid: istaxvalid??this.istaxvalid,
    );
  }
}