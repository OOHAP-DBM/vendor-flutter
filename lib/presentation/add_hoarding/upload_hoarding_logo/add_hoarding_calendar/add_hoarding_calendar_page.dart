import 'package:flutter/widgets.dart';
import 'package:oohapp/core/app_export.dart';

class AddHoardingCalendarPage extends StatelessWidget {
  const AddHoardingCalendarPage({super.key});

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
      body:  Padding(
        padding: EdgeInsetsDirectional.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                 CustomTextFormField(
                  placeholder: 'Manage Availibility*',
                  hintText: 'Available/Block dates',
                  suffixIcon: Icon(Icons.calendar_today_outlined),
                 ),
                 SizedBox(height: 500,),
                 CustomButton(onTap: (){}, text: 'Save & generate QR'),
                 SizedBox(height: 12,),
                 CustomButton(onTap: (){}, text: 'Cancel')
          ],
        ),
        ),
    );
  }
}