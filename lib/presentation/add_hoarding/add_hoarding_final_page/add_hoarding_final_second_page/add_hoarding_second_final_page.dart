
import 'package:oohapp/core/constants/global_cubit/form_validation_cubit.dart';
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
      TextEditingController basepriceController=TextEditingController();
      TextEditingController printingController=TextEditingController();
      TextEditingController mountingController=TextEditingController();
      TextEditingController designingController=TextEditingController();

  @override
  Widget build(BuildContext context) {
        final formValidationCubit = BlocProvider.of<FormValidationCubit>(context);
   

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Business Details',
        centerTitle: true,
        elevation: 1,
        leading: Padding(
          padding:  const EdgeInsets.symmetric(horizontal: 8.0),
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
          padding:  const EdgeInsetsDirectional.all(16.0),
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
                placeholder: 'Set Base Price*',
                hintText: '₹',
                keyboardType: TextInputType.number,
                controller: basepriceController,
                  onChanged: (val) {
                     formValidationCubit.validateField(
                      'base price ', basepriceController.text);
                },

              ),
               const SizedBox(
                height: 15,
              ),
               CustomTextFormField(
                placeholder: 'Printing Charges*',
                hintText: '₹',
                keyboardType: TextInputType.number,
                         controller:printingController,
                onChanged: (val) {
                     formValidationCubit.validateField(
                      'category ', printingController.text);
                },
              ),
               const SizedBox(
                height: 15,
              ),
               CustomTextFormField(
                placeholder: 'Mounting Charges*',
                hintText: '₹',
                keyboardType: TextInputType.number,
                         controller: mountingController,
                onChanged: (val) {
                     formValidationCubit.validateField(
                      'category ', mountingController.text);
                },

              ),
               const SizedBox(
                height: 15,
              ),
               CustomTextFormField(
                placeholder: 'Designing Charges*',
                hintText: '₹',
                keyboardType: TextInputType.number,
                         controller: designingController,
                onChanged: (val) {
                     formValidationCubit.validateField(
                      'category ', designingController.text);
                },
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

NewCustomSliderButton(
  title: 'By Yearly',
  initialValue: showByYearlyUI,
  onToggle: (isOn) {
    setState(() {
      showByYearlyUI = isOn;
    });
  },
),
if (showByYearlyUI) _buildAdditionalUI('yearly'),

              const SizedBox(height: 32,),
                 CustomButton(
                onTap: () {
                     NavigateUtils.pushNamedReplacement(
                        context, Routes.uploadimagehoardingpage);
                  // if (formValidationCubit.isFormValid()) {
                  //   NavigateUtils.pushNamedReplacement(
                  //       context, Routes.finalsecondaddhoardingScreeen);
                  // } else {
             
                  // }
                },
                text: 'Continue',
                backgroundColor: formValidationCubit.isFormValid()
                    ?  const Color(0xFFDDDDDD)
                    :  const Color(0xFF282C3E),
              )

            ],
          ),
        ),
      ),
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
    return Padding(
      padding:  const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           const CustomTextFormField(
            placeholder: 'GST(%)*',
            hintText: '18%',
          ),
           const SizedBox(
            height: 15,
          ),
           const CustomTextFormField(
            placeholder: 'IGST(%)*',
            hintText: '18%',
          ),
           const SizedBox(
            height: 15,
          ),
          Container(
            width: 343,
            height: 46,
            padding:  const EdgeInsets.symmetric(horizontal: 12),
            decoration: ShapeDecoration(
              color:  const Color(0xFFFFB753),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3)),
            ),
            child:  const Row(
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
            placeholder: 'Discount Type*',
            hintText: 'Amount',
            keyboardType: TextInputType.number,
          ),
           const SizedBox(
            height: 15,
          ),
           const CustomTextFormField(
            placeholder: 'Discount Percentage/Amount*',
            hintText: '₹ 40,111',
            keyboardType: TextInputType.number,
          ),
        
        ],
      ),
    );
  }
}
