import 'dart:io';

import 'package:oohapp/core/constants/global_cubit/form_validation_cubit.dart';

import 'package:oohapp/presentation/add_hoarding/second_hoarding_page/ifsc_finder_bloc/ifsc_finder_bloc.dart';
import 'package:oohapp/presentation/add_hoarding/second_hoarding_page/ifsc_finder_bloc/ifsc_finder_event.dart';
import 'package:oohapp/presentation/add_hoarding/second_hoarding_page/ifsc_finder_bloc/ifsc_finder_state.dart';
import 'package:oohapp/widgets/document_uploader/document_uploader_widget.dart';
import 'package:oohapp/widgets/textfield_with_suffixtext/interactive_textfield.dart';
import 'package:oohapp/widgets/textfield_without_title/custom_textfield.dart';

import '../../../core/app_export.dart';
import '../../../widgets/dropdown_textfield/dropdown_selector.dart';

class SecondAddHoardingPage extends StatefulWidget {
  const SecondAddHoardingPage({super.key});

  @override
  State<SecondAddHoardingPage> createState() => _SecondAddHoardingPageState();
}

class _SecondAddHoardingPageState extends State<SecondAddHoardingPage> {
  
  void showIFSCFinder(BuildContext context) {
    TextEditingController bankController=TextEditingController();
    TextEditingController stateController=TextEditingController();
    TextEditingController cityController=TextEditingController();
    TextEditingController branchController=TextEditingController();
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          width: 343,
          height: 348,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomText.secondaryTitle(
                  text: 'Find IFSC Code', color: Colors.black),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                     onDropdownChanged: (val) {
                  BlocProvider.of<IFSCFinderBloc>(context).add(
                      DropdownSelectionChanged(
                          bankController.text,
                         cityController.text,
                          stateController.text,
                          branchController.text
                         )
                         );
                },
                controller: bankController,
                hintText: 'choose bank',
                choices: ['HDFC', 'SBI', 'CANARA BANK'],
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                controller: stateController,
                     onDropdownChanged: (val) {
                  BlocProvider.of<IFSCFinderBloc>(context).add(
                      DropdownSelectionChanged(
                          bankController.text,
                         cityController.text,
                          stateController.text,
                          branchController.text
                         )
                         );
                },
                hintText: 'choose state',
                choices: ['UP', 'Rajasthan', 'MP'],
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                controller: cityController,
                     onDropdownChanged: (val) {
                  BlocProvider.of<IFSCFinderBloc>(context).add(
                      DropdownSelectionChanged(
                          bankController.text,
                         cityController.text,
                          stateController.text,
                          branchController.text
                         )
                         );
                },
                hintText: 'choose city',
                choices: ['Lucknow', 'Kanpur', 'Delhi'],
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                controller: branchController,
                     onDropdownChanged: (val) {
                  BlocProvider.of<IFSCFinderBloc>(context).add(
                      DropdownSelectionChanged(
                          bankController.text,
                         cityController.text,
                          stateController.text,
                          branchController.text
                         )
                         );
                },
                hintText: 'choose branch',
                choices: ['gomtinagar', 'pahadganj', 'raniganj'],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left:50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                 BlocBuilder<IFSCFinderBloc, IFSCFinderState>(
                builder: (context, state) {
                  return CustomButton(
                    onTap: () {
                     
                    },
                    text: 'Cancel',
                    backgroundColor: (state is IFSCFinderValidState)
                        ? Color(0xFFDDDDDD)
                        : Color(0xFFDDDDDD),
                  );
                },
              ),
                     BlocBuilder<IFSCFinderBloc, IFSCFinderState>(
                builder: (context, state) {
                  return CustomButton(
                    onTap: () {
                     
                    },
                    text: 'Save',
                    backgroundColor: (state is IFSCFinderValidState)
                        ? Color(0xFFDDDDDD)
                        :  Color(0xFF282C3E),
                  );
                },
              ),
                  ],
                ),
              )
            ],
          ),
        
        );
      },
    );
  }

  File? selectedFile;

  void handleFileSelection(File file) {
    setState(() {
      selectedFile = file;
    });

    // Here you could also upload the file or do other processing
  }

  TextEditingController banknameController = TextEditingController();
  TextEditingController accountholdernameController = TextEditingController();
  TextEditingController accountController = TextEditingController();
  TextEditingController ifsccodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
        final formValidationCubit = BlocProvider.of<FormValidationCubit>(context);
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText.secondaryTitle(
                text: 'Bank Account Details ',
                color: CustomColors.blackColor,
              ),
              const SizedBox(
                height: 7,
              ),
              CustomText.calloutText(
                text:
                    'For a successful bank verification, account name must\nmatch with the registered GSTIN name',
                color: CustomColors.blackColor,
              ),
              const SizedBox(height: 7),
              CustomTextFieldSelector(
                controller: banknameController,

                placeholder: 'Bank Name*',
                // maxLength: 15,
                // keyboardType: TextInputType.number,
                hintText: "choose bank name ",
                choices: ['SBI', 'HDFC', 'RBI', 'KOTAK MAHINDAR'],
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextFormField(
                controller: accountholdernameController,
                onChanged: (val) {
                     formValidationCubit.validateField(
                      'bank name ', banknameController.text);
                },
                placeholder: 'Account Holder Name*',
                // maxLength: 15,
                keyboardType: TextInputType.name,
                hintText: "Enter account holder name",
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextFormField(
                controller: accountController,
                onChanged: (val) {
                      formValidationCubit.validateField(
                      'account holder', accountholdernameController.text);
                },
                placeholder: 'Account Number*',
                // maxLength: 15,
                keyboardType: TextInputType.phone,
                hintText: "Enter Account Number",
              ),
              NewCustomTextFormField(
                controller: ifsccodeController,
                onChanged: (val) {
     formValidationCubit.validateField(
                      'account number', accountController.text);
                },
                placeholder: 'IFSC Code*',
                hintText: "Enter IFSC Code",
                lasttext: 'Find IFSC code',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomText.secondaryTitle(
                text: 'Lets’s add Business PAN ',
                color: CustomColors.blackColor,
              ),
              const SizedBox(
                height: 7,
              ),
              CustomText.calloutText(
                text:
                    "Business’s PAN card should clearly show Business’s detail on the front, and shouldn't be blurry.",
                color: CustomColors.blackColor,
              ),
              SizedBox(
                height: 15,
              ),
              EditableImageUpload(
                title: 'upload PAN',
                allowedExtensions: ['PNG', 'JPG', 'PDF'],
                onFileSelected: handleFileSelection,
              ),
              SizedBox(
                height: 20,
              ),
CustomButton(
                onTap: () {
                  if (formValidationCubit.isFormValid()) {
                    NavigateUtils.pushNamedReplacement(
                        context, Routes.gettingstartedfirstScreen);
                  } else {
             
                  }
                },
                text: 'Save & Finish',
                backgroundColor: formValidationCubit.isFormValid()
                    ? Color(0xFFDDDDDD)
                    : Color(0xFF282C3E),
              )
           
            ],
          ),
        ),
      ),
    );
  }
}
