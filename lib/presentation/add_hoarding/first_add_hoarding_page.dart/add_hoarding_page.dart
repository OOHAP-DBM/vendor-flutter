import 'package:oohapp/core/app_export.dart';
import 'package:oohapp/presentation/add_hoarding/first_add_hoarding_page.dart/cubic/add_hoarding_bloc.dart';
import 'package:oohapp/presentation/add_hoarding/first_add_hoarding_page.dart/cubic/add_hoarding_event.dart';
import 'package:oohapp/presentation/add_hoarding/first_add_hoarding_page.dart/cubic/add_hoarding_state.dart';
import 'package:oohapp/widgets/dropdown_textfield/dropdown_selector.dart';

class AddHoardingScreen extends StatefulWidget {
  const AddHoardingScreen({super.key});

  @override
  State<AddHoardingScreen> createState() => _AddHoardingScreenState();
}

class _AddHoardingScreenState extends State<AddHoardingScreen> {
  TextEditingController streetController=TextEditingController();
    TextEditingController gstinController=TextEditingController();
    TextEditingController businessnameController=TextEditingController();
    TextEditingController businesstypeController=TextEditingController();
    TextEditingController pincodeController= TextEditingController();
    TextEditingController cityController=TextEditingController();
    TextEditingController stateController=TextEditingController();
    TextEditingController countryController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    
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
              BlocBuilder<AddHoardingBloc,AddHoardingState>(
                builder: (context,state){
                  if(state is AddHoardingErrorState){
                    return Text(state.errorMessage,style:TextStyle(color: Colors.red));
                  }
                  else{
                    return Container();
                  }
                },
              ),
              SizedBox(height: 7,),
               CustomTextFormField(
                controller: gstinController,
                placeholder: 'GSTIN No',
                // maxLength: 15,
                keyboardType: TextInputType.number,
                hintText: "Enter GSTIN No",
                onChanged: (val){
                BlocProvider.of<AddHoardingBloc>(context).add(
                  AddHoardingTextChangedEvent(gstinController.text, 
                  businessnameController.text,
                   businesstypeController.text,
                    pincodeController.text, 
                    cityController.text,
                     stateController.text,
                      countryController.text)
                );
                },
                
              ),
              const SizedBox(
                height: 15.0,
              ),
               CustomTextFormField(
                controller: businessnameController,
                placeholder: 'Business Name',
                // maxLength: 15,
                keyboardType: TextInputType.name,
                hintText: "Enter business name ",
              ),
              const SizedBox(
                height: 15.0,
              ),
              CustomTextFieldSelector(
                controller: businesstypeController,
                placeholder: 'Business Type',
                // maxLength: 15,
                keyboardType: TextInputType.number,
                hintText: "choose business type ",
                choices: ['Sole proprietorship', 'Partnership', 'Limited liability company', 'Company','Private limited company','Limited liability partnership','Governmnent','Public Limited Company','Hindu joint company'],
              ),
              const SizedBox(
                height: 7.0,
              ),
              Container(
                width: 343,
                decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Color(0xFFE0E0E0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 7,),
                 CustomText.secondaryTitle(
                    text: 'Registered Business Address',
                    color: CustomColors.blackColor,
                  ),
              SizedBox(height: 10,),
               CustomTextFormField(
               
                placeholder: 'Street Address',
                
                keyboardType: TextInputType.name,
                hintText: "Enter street address",
                maxLength: 64,
                controller: streetController,
                showCharacterCount: true,
              ),
              const SizedBox(
                height: 15.0,
              ),
                  CustomTextFormField(
                    controller:pincodeController,
                placeholder: 'Pincode*',
                
                keyboardType: TextInputType.name,
                hintText: "Enter pincode",
                maxLength: 64,
              
                showCharacterCount: true,
              ),
              const SizedBox(
                height: 15.0,
              ),
          CustomTextFieldSelector(
                controller: cityController,
                placeholder: 'City*',
                // maxLength: 15,
                keyboardType: TextInputType.number,
                hintText: "choose city",
                choices: ['Lucknow', 'Kanpur', 'Delhi', 'Bikaner'],
              ),
              const SizedBox(height: 15,),
                         CustomTextFieldSelector(
                          controller: stateController,
                placeholder: 'State*',
                // maxLength: 15,
                keyboardType: TextInputType.number,
                hintText: "choose state",
                choices: ['UP', 'Delhi', 'Himachal Pradesh', 'Rajasthan'],
              ),
              SizedBox(height: 15,),
                           CustomTextFieldSelector(
                            controller: countryController,
                placeholder: 'Country*',
                // maxLength: 15,
                keyboardType: TextInputType.number,
                hintText: "choose country",
                choices: ['India', 'USA', 'Japan', 'Russia'],
              ),
              SizedBox(height: 20,),
              BlocBuilder<AddHoardingBloc,AddHoardingState>(
                builder: (context,state){
                  return    CustomButton(
                    onTap: () {
                      NavigateUtils.pushNamedReplacement(context, Routes.secondhoardingScreen);
                    },
                    text: 'Continue',
                    backgroundColor:
                        (state is AddHoardingValidState)?Color(0xFFDDDDDD):Color(0xFF282C3E),
                  );
                },
              )
                
            ],
          ),
        ),
      ),
    );
  }
}
