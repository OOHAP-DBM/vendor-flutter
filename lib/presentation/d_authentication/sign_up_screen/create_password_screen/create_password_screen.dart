import 'package:oohapp/core/app_export.dart';

class CreatePasswordScreen extends StatelessWidget {
  const CreatePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: 'Password',
        centerTitle: true,
        elevation: 1,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: CircularButton(
            onPressed: () {
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
        physics: const AlwaysScrollableScrollPhysics(),
        child: Container(
          // height: ScaleSize.height(80),
          width: size.width,
          constraints: BoxConstraints(
            maxHeight: size.height * 0.88,
          ),
          child: Container(
            //   height: ScaleSize.height(80),
            width: size.width,
            alignment: Alignment.topLeft,
            padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 14.0),

            child: Column(
              //  mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText.headlineText(
                    text: 'Create your password',
                    color: CustomColors.blackColor),
                CustomText.subHeadingText(
                    text:
                        'Minimum 8 character, must be one uppercase letter, one lower case letter number & symbol.',
                    color: CustomColors.mediumGrey,
                    textAlign: TextAlign.start,
                    textDecoration: TextDecoration.none),
                const SizedBox(
                  height: 35.0,
                ),
                const CustomTextFormField(
                  placeholder: 'Password*',
                  // maxLength: 10,
                  // keyboardType: TextInputType.number,
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.key_rounded),
                  suffixIcon: Icon(Icons.visibility_off),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const CustomTextFormField(
                  placeholder: 'Confirm Password*',
                  // maxLength: 10,
                  // keyboardType: TextInputType.number,
                  hintText: 'Confirm password',
                  prefixIcon: Icon(Icons.key_outlined),
                  suffixIcon: Icon(Icons.visibility_off),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const Spacer(),
                CustomButton(
                    backgroundColor: CustomColors.inactiveButton,
                    onTap: () {
                      NavigateUtils.pushNamed(context, Routes.dashboardScreen);
                    },
                    text: 'Save & Continue'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
