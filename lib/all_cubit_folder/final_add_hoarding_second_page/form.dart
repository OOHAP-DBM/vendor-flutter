class FinalSecondAddHoardingFormState {
  final String setbaseprice;
  final String pricingcharges;
  final String mountingcharge;
  final String designingcharge;

  // Validation checks
  final bool issetpricevalid;
  final bool ispricingchargevalid;
  final bool ismountingchargevalid;
  final bool isdesigningchargevalid;
  final bool issecondpricevalid;

  const FinalSecondAddHoardingFormState({
    this.setbaseprice = '',
    this.pricingcharges = '',
    this.mountingcharge = '',
    this.designingcharge = '',
    this.issetpricevalid = false,
    this.ispricingchargevalid = false,
    this.ismountingchargevalid = false,
    this.isdesigningchargevalid = false,
    this.issecondpricevalid = false,
  });

  FinalSecondAddHoardingFormState copyWith({
    String? setbaseprice,
    String? pricingcharges,
    String? mountingcharge,
    String? designingcharge,
    bool? issetpricevalid,
    bool? ispricingchargevalid,
    bool? ismountingchargevalid,
    bool? isdesigningchargevalid,
    bool? issecondpricevalid,
  }) {
    return FinalSecondAddHoardingFormState(
      setbaseprice: setbaseprice ?? this.setbaseprice,
      pricingcharges: pricingcharges ?? this.pricingcharges,
      mountingcharge: mountingcharge ?? this.mountingcharge,
      designingcharge: designingcharge ?? this.designingcharge,
      issetpricevalid: issetpricevalid ?? this.issetpricevalid,
      ispricingchargevalid: ispricingchargevalid ?? this.ispricingchargevalid,
      ismountingchargevalid: ismountingchargevalid ?? this.ismountingchargevalid,
      isdesigningchargevalid: isdesigningchargevalid ?? this.isdesigningchargevalid,
      issecondpricevalid: issecondpricevalid ?? this.issecondpricevalid,
    );
  }
}