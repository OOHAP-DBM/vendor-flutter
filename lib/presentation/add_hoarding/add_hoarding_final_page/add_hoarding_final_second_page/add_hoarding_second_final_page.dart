import 'package:oohapp/all_cubit_folder/final_add_hoarding_first_page/cubit.dart';
import 'package:oohapp/all_cubit_folder/final_add_hoarding_second_page/cubit.dart';
import 'package:oohapp/all_cubit_folder/final_add_hoarding_second_page/form.dart';
import 'package:oohapp/core/constants/global_cubit/form_validation_cubit.dart';
import 'package:oohapp/core/constants/waste/cubit.dart';
import 'package:oohapp/core/waste_work/validator_regex.dart';
import 'package:oohapp/presentation/add_hoarding/add_hoarding_final_page/add_hoarding_final_second_page/widgets/custom_slider_button_new.dart';

import '../../../../core/app_export.dart';

class FinalAddHoardingSecondPage extends StatefulWidget {
  const FinalAddHoardingSecondPage({super.key});

  @override
  State<FinalAddHoardingSecondPage> createState() =>
      _FinalAddHoardingSecondPageState();
}

class _FinalAddHoardingSecondPageState
    extends State<FinalAddHoardingSecondPage> {
  bool showByWeeklyUI = false;
  bool showByMonthlyUI = false;
  bool showByYearlyUI = false;
  TextEditingController basepriceController = TextEditingController();
  TextEditingController printingController = TextEditingController();
  TextEditingController mountingController = TextEditingController();
  TextEditingController designingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FinalSecondAddHoardingScreenCubit,
        FinalSecondAddHoardingFormState>(
      builder: (context, state) {
        final cubit = context.read<FinalSecondAddHoardingScreenCubit>();
        return Scaffold(
          appBar: CustomAppBar(
            title: 'Business Details',
            centerTitle: true,
            elevation: 1,
            leading: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: CircularButton(
                onTap: () {
                  Navigator.pop(context);
                },
                backgroundColor: CustomColors.grey,
                borderColor: CustomColors.transparent,
                icon: Icons.arrow_back,
                iconColor: CustomColors.blackColor,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsetsDirectional.all(16.0),
              child: Form(
                key: cubit.finalsecondaddhoardingFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText.secondaryTitle(
                      text: 'Add Hoarding',
                      color: CustomColors.blackColor,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      'Pricing',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF282C3E),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomTextFormField(
                      requiredsign: true,
                      onChanged: (value) {
                        cubit.onChangedsetbaseprice(value);
                      },
                      validator: (value) =>
                          ValidatorRegex.basepricevalidator(value),
                      placeholder: 'Set Base Price',
                      hintText: '₹',
                      keyboardType: TextInputType.number,
                      controller: basepriceController,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                      requiredsign: true,
                      placeholder: 'Printing Charges',
                      hintText: '₹',
                      keyboardType: TextInputType.number,
                      controller: printingController,
                      onChanged: (value) {
                        cubit.onChangedpricingcharge(value);
                      },
                      validator: (value) =>
                          ValidatorRegex.pricingchargevalidator(value),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                      requiredsign: true,
                      placeholder: 'Mounting Charges',
                      hintText: '₹',
                      keyboardType: TextInputType.number,
                      controller: mountingController,
                      onChanged: (value) {
                        cubit.onChangedmountingcharges(value);
                      },
                      validator: (value) =>
                          ValidatorRegex.mountingchargevalidator(value),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                      requiredsign: true,
                      placeholder: 'Designing Charges',
                      hintText: '₹',
                      keyboardType: TextInputType.number,
                      controller: designingController,
                      onChanged: (value) {
                        cubit.onChangeddesigningcharge(value);
                      },
                      validator: (value) =>
                          ValidatorRegex.designingchargevalidator(value),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    NewCustomSliderButton(
                      title: 'By Weekly',
                      initialValue: showByWeeklyUI,
                      onToggle: (isOn) {
                        setState(() {
                          showByWeeklyUI = isOn;
                        });
                      },
                    ),
                    if (showByWeeklyUI) _buildAdditionalUI('weekly'),
                    SizedBox(height: 16,),
                    NewCustomSliderButton(
                      title: 'By Monthly',
                      initialValue: showByMonthlyUI,
                      onToggle: (isOn) {
                        setState(() {
                          showByMonthlyUI = isOn;
                        });
                      },
                    ),
                    if (showByMonthlyUI) _buildAdditionalUI('monthly'),
                       SizedBox(height: 16,),
                    NewCustomSliderButton(
                      title: 'By Yearly',
                      initialValue: showByYearlyUI,
                      onToggle: (isOn) {
                        setState(() {
                          showByYearlyUI = isOn;
                        });
                      },
                    ),
                       SizedBox(height: 16,),
                    if (showByYearlyUI) _buildAdditionalUI('yearly'),
                    const SizedBox(
                      height: 32,
                    ),
                    CustomButton(
                      onTap: () {
                        if (state.issecondpricevalid) {
                          NavigateUtils.pushNamedReplacement(
                              context, Routes.uploadimagehoardingpage);
                        }
                      },
                      text: 'Continue',
                      backgroundColor: state.issecondpricevalid
                          ? const Color(0xFF282C3E)
                          : const Color(0xFFDDDDDD),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAdditionalUI(String type) {
    // Define the widget that you want to return for each type
    Widget additionalWidget;
    switch (type) {
      case 'weekly':
        additionalWidget = _buildAdditional();
        break;
      case 'monthly':
        additionalWidget = _buildAdditional();
        break;
      case 'yearly':
        additionalWidget = _buildAdditional();
        break;
      default:
        // Return an empty Container for the default case
        additionalWidget = Container();
        break;
    }
    return additionalWidget;
  }

  Widget _buildAdditional() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTextFormField(
          requiredsign: true,
          placeholder: 'GST(%)',
          hintText: '18%',
        ),
        const SizedBox(
          height: 15,
        ),
        const CustomTextFormField(
          requiredsign: true,
          placeholder: 'IGST(%)',
          hintText: '18%',
        ),
        const SizedBox(
          height: 15,
        ),
        const Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Total Price with Tax',
                style: TextStyle(
                  color: Color(0xFF282C3E),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              TextSpan(
                text: '*',
                style: TextStyle(
                  color: Color(0xFFE75858),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          width: double.infinity,
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: ShapeDecoration(
            color: const Color(0xFFFFB753),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '₹ 2,36,611',
                style: TextStyle(
                  color: Color(0xFF1E1B18),
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const CustomTextFormField(
          requiredsign: true,
          placeholder: 'Discount Type',
          hintText: 'Amount',
          keyboardType: TextInputType.number,
        ),
        const SizedBox(
          height: 15,
        ),
        const CustomTextFormField(
          requiredsign: true,
          placeholder: 'Discount Percentage/Amount',
          hintText: '₹ 40,111',
          keyboardType: TextInputType.number,
        ),
        const SizedBox(
          height: 15,
        ),
        const Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Discounted Price',
                style: TextStyle(
                  color: Color(0xFF282C3E),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              TextSpan(
                text: '*',
                style: TextStyle(
                  color: Color(0xFFE75858),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          width: double.infinity,
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: ShapeDecoration(
            color: const Color(0xFFFFB753),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '₹ 36,000',
                style: TextStyle(
                  color: Color(0xFF1E1B18),
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
