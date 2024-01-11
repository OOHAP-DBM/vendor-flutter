
import 'package:oohapp/core/constants/global_cubit/form_validation_cubit.dart';
import 'package:oohapp/presentation/add_hoarding/add_hoarding_final_page/widgets/custom_check_button.dart';
import 'package:oohapp/presentation/add_hoarding/add_hoarding_final_page/widgets/custom_slider_button.dart';
import 'package:oohapp/presentation/add_hoarding/add_hoarding_final_page/widgets/custom_small_button.dart';
import 'package:oohapp/widgets/dropdown_textfield/dropdown_selector.dart';

import '../../../core/app_export.dart';
import 'widgets/custom_tag_selector_textfield.dart';

class FinalAddHoardingFirstPage extends StatefulWidget {
  const  FinalAddHoardingFirstPage({super.key});

  @override
  State<FinalAddHoardingFirstPage> createState() =>
      _FinalAddHoardingFirstPageState();
}

class _FinalAddHoardingFirstPageState extends State<FinalAddHoardingFirstPage> {
   
  TextEditingController categoryController=TextEditingController();
  TextEditingController hoardingtitleController=TextEditingController();
  TextEditingController hoardingdescriptionController=TextEditingController();
  TextEditingController measurementController=TextEditingController();
  TextEditingController hoardingwidthController=TextEditingController();
  TextEditingController hoardingheightController=TextEditingController();
  TextEditingController sizeController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final formValidationCubit = BlocProvider.of<FormValidationCubit>(context);
    List<String> options = [
      'Metro view',
      'Bridge view',
      'Left side road',
      'Right side road'
    ];
    String? selectedButton;
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Add Hoarding',
        centerTitle: true,
        elevation: 1,
        leading: Padding(
          padding:  const EdgeInsets.symmetric(horizontal: 8.0),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon:  const Icon(Icons.clear),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText.headlineText(text: 'Hoarding Details'),
               const SizedBox(
                height: 12,
              ),
              CustomText.calloutText(
                text: 'Select Hoarding Type*',
                color: CustomColors.blackColor,
              ),
               const SizedBox(
                height: 10,
              ),
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomSmallButton(
                      onTap: () {
                        setState(() {
                          selectedButton = 'OOH Hoarding';
                        });
                      },
                      text: 'OOH Hoarding',
                      backgroundColor: selectedButton == 'OOH Hoarding'
                          ? Colors.green
                          : Colors.white,
                      textColor: Colors.black,
                    ),
                    CustomSmallButton(
                      onTap: () {
                        setState(() {
                          selectedButton = 'DOOH Hoarding';
                        });
                      },
                      text: 'DOOH Hoarding',
                      backgroundColor: selectedButton == 'DOOH Hoarding'
                          ? Colors.green
                          : Colors.white,
                      textColor: Colors.black,
                    ),
                  ]),
               const SizedBox(
                height: 15,
              ),
               CustomTextFieldSelector(
                placeholder: 'Categories*',
                text: 'choose category',
                choices: const[
                  'Unipole',
                  'Billboard',
                  'Wall wrap',
                  'Pole kiosk',
                  'Digital screen',
                  'LED',
                  'Public utility',
                  'Metro bridge panel',
                  'Door branding',
                  'Flag sign',
                  'Foot over bridge',
                  'ACP board'
                ],
                    controller: categoryController,
                  onChanged: (val) {
                       formValidationCubit.validateField(
                        'category ', categoryController.text);
                  },
              ),
               const SizedBox(
                height: 15,
              ),
               CustomTextFormField(
                placeholder: 'Hoarding Title*',
                text: 'Enter title',
                maxLength: 34,
                showCharacterCount: true,
                    controller: hoardingtitleController,
                  onChanged: (val) {
                       formValidationCubit.validateField(
                        'bank name ', hoardingtitleController.text);
                  },
              ),
               const SizedBox(
                height: 15,
              ),
               CustomTextFormField(
                placeholder: 'Hoarding description*',
                height: 109,
                text: 'write description',
                maxLength: 34,
                showCharacterCount: true,
                    controller: hoardingdescriptionController,
                  onChanged: (val) {
                       formValidationCubit.validateField(
                        'hoarding description', hoardingdescriptionController.text);
                  },
              ),
               const SizedBox(
                height: 16,
              ),
               CustomTextFormField(
                placeholder: 'Measurement ln*',
                text: 'Sq.ft',
                   controller: measurementController,
                  onChanged: (val) {
                       formValidationCubit.validateField(
                        'measurement', measurementController.text);
                  },
              ),
               const SizedBox(
                height: 15,
              ),
               Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextFormField(
                    placeholder: 'Hoarding Width*',
                    hintText: 'Enter width',
                    width: 165,
                    keyboardType: TextInputType.number,
                              controller: hoardingwidthController,
                  onChanged: (val) {
                       formValidationCubit.validateField(
                        'hoarding width', hoardingwidthController.text);
                  },
                  ),
                  CustomTextFormField(
                    placeholder: 'Hoarding Height*',
                    hintText: 'Enter height',
                    width: 165,
                    keyboardType: TextInputType.number,
                              controller: hoardingheightController,
                  onChanged: (val) {
                       formValidationCubit.validateField(
                        'bank name ', hoardingheightController.text);
                  },
                  ),
                ],
              ),
               const SizedBox(
                height: 15,
              ),
               CustomTextFormField(
                placeholder: 'Size Preview',
                hintText: 'e.g. 10×20sq.ft',
                color: const Color.fromARGB(1, 183, 189, 214),
              controller: sizeController,
              ),
               const SizedBox(height: 15),
               const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomSliderButton(title: 'Approved from nagar nigam'),
                    SizedBox(height: 20),
                    CustomSliderButton(title: 'Backlighting'),
                    SizedBox(height: 20),
                    CustomSliderButton(title: 'Printing & Mounting service'),
                  ],
                ),
              ),
               const SizedBox(
                height: 15,
              ),
               const CustomTextFormField(
                placeholder: 'People Football',
                hintText: 'Enter in Number',
                keyboardType: TextInputType.number,
              ),
               const SizedBox(
                height: 16,
              ),
              Container(
                width: 343,
                decoration:  const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Color(0xFFE0E0E0),
                    ),
                  ),
                ),
              ),
               const SizedBox(
                height: 16,
              ),
               const TagsInputField(
                labelText: 'Target Audience',
                initialTags: ['Students', 'Foodies', 'Public', 'average class'],
              ),
               const SizedBox(
                height: 16,
              ),
              Container(
                width: 343,
                decoration:  const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Color(0xFFE0E0E0),
                    ),
                  ),
                ),
              ),
               const SizedBox(
                height: 16,
              ),
              CustomText.secondaryTitle(
                  text: 'Hoarding Visibility', color: Colors.black),
               const SizedBox(
                height: 12,
              ),
              Column(
                children: options.map((title) {
                  return CustomCheckboxTile(
                    title: title,
                    onChanged: (bool value) {
                      print('$title is now: $value');
                    },
                  );
                }).toList(),
              ),
               const SizedBox(height:16),
              CustomButton(
                  onTap: () {
                    if (formValidationCubit.isFormValid()) {
                      NavigateUtils.pushNamedReplacement(
                          context, Routes.finalsecondaddhoardingScreeen);
                    } else {
               
                    }
                  },
                  text: 'Save & Finish',
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
}
