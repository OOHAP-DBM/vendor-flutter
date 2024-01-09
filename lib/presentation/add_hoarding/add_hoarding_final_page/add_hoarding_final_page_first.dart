
import 'package:oohapp/presentation/add_hoarding/add_hoarding_final_page/widgets/custom_small_button.dart';
import 'package:oohapp/widgets/dropdown_textfield/dropdown_selector.dart';

import '../../../core/app_export.dart';

class FinalAddHoardingFirstPage extends StatelessWidget {
  const FinalAddHoardingFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Add Hoarding',
        centerTitle: true,
        elevation: 1,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.clear),
          ),
        ),
      ),
      body:  Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           CustomText.headlineText(
            text: 'Hoarding Details'
           ),
            const SizedBox(
              height: 12,
            ),
                      CustomText.calloutText(
            text: 'Select Hoarding Type*',
            color: CustomColors.blackColor,
          ),
          const SizedBox(height: 10,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomSmallButton(onTap: (){}, text: 'OOH Hoarding'),
            CustomButton(onTap: (){}, text: 'DOOH Hoarding'),
            const SizedBox(height: 15,),
            const CustomTextFieldSelector(
              placeholder: 'Categories*',
              text: 'choose category',
              choices: ['Unipole','Billboard','Wall wrap','Pole kiosk','Digital screen','LED','Public utility','Metro bridge panel','Door branding','Flag sign','Foot over bridge','ACP board'],
            ),
            const SizedBox(height: 15,),
            const CustomTextFormField(
              placeholder: 'Hoarding Title*',
              text: 'Enter title',
              maxLength: 34,
              showCharacterCount: true,
            ),
            const SizedBox(height: 15,),
            const CustomTextFormField(
              placeholder: 'Hoarding description*',
              height: 109,
              text: 'write description',
                 maxLength: 34,
              showCharacterCount: true,
            ),
            const SizedBox(height: 16,),
            const CustomTextFormField(
              placeholder: 'Measurement ln*',
              text: 'Sq.ft',
            )

          ],
        )
          ],
        ),
      ),
    );
  }
}
