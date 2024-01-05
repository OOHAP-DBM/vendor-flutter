import 'package:oohapp/core/app_export.dart';
import 'package:oohapp/widgets/custom_buttons/google_button.dart';
import 'login_otp_screen/login_otp_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SizedBox(
          height: ScaleSize.height(100),
          width: ScaleSize.width(100),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: ScaleSize.height(20),
                  width: ScaleSize.width(50),
                  child: CustomSvgImageView(
                    svgPath: ImageConstant.vendorLogo,
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  //   height: ScaleSize.height(80),
                  width: ScaleSize.width(100),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14.0, vertical: 14.0),
                  decoration: BoxDecoration(
                      // color: backgroundColor ?? Colors.transparent,
                      //  color: Colors.green.shade200,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: Colors.grey,
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText.primaryTitle(
                          text: 'Welcome to OOHAPP!',
                          color: CustomColors.blackColor),
                      const SizedBox(
                        height: 5.0,
                      ),
                      CustomText.bodyText(
                          text: 'Login to your existing account',
                          color: CustomColors.mediumGrey),
                      const SizedBox(
                        height: 35.0,
                      ),
                      //  CustomTextFormField(onPressed: onPressed, text: text, controller: controller),
                      /*  const CustomTextFormField(
                        labelText: 'Mobile Number',
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                        hintText: '8524791231',
                        prefixIcon: Icon(Icons.phone_android_outlined),
                      ),*/
                      const CustomTextFormField(
                        placeholder: 'Mobile Number*',
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                        hintText: 'Enter mobile number',
                        prefixIcon: Icon(Icons.phone_android_rounded),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          /* Expanded(
                            child: Container(
                              color: Colors.red,
                              width: ScaleSize.width(100),
                              height: 50,
                            ),
                          ),*/
                          const Divider(
                              // color: CustomColors.liteGrey,
                              color: Colors.red),
                          CustomText.subHeadingText(
                              text: 'OR',
                              color: CustomColors.grey,
                              fontSize: 15),
                          const Divider(
                              // color: CustomColors.liteGrey,
                              color: Colors.red),
                        ],
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),

                      const CustomTextFormField(
                        placeholder: 'Email address*',
                        // maxLength: 10,
                        keyboardType: TextInputType.emailAddress, 
                        hintText: 'abc@gmail.com',
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      CustomButton(
                          backgroundColor: CustomColors.inactiveButton,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginOtpScreen(),
                                ));
                          },
                          text: 'Continue'),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          /* Expanded(
                            child: Container(
                              color: Colors.red,
                              width: ScaleSize.width(100),
                              height: 50,
                            ),
                          ),*/
                          const Divider(
                              // color: CustomColors.liteGrey,
                              color: Colors.red),
                          CustomText.subHeadingText(
                            text: 'Or login with',
                            color: CustomColors.grey,
                          ),
                          const Divider(
                              // color: CustomColors.liteGrey,
                              color: Colors.red),
                        ],
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      GoogleButton(
                          backgroundColor: CustomColors.tertiaryLite,
                          onTap: () {
                        NavigateUtils.pushNamed(context, Routes.loginWithPasswordScreen);
                      }, text: 'Continue with Google'),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Wrap(
                        direction: Axis.horizontal,
                        // crossAxisAlignment: WrapCrossAlignment.center,
                        alignment: WrapAlignment.center,
                        spacing: 2,
                        runSpacing: 2,
                        children: [
                          CustomText.subHeadingText(
                            text: 'By continuing, I agree to the',
                            color: CustomColors.grey,
                          ),
                          //Terms & Conditions
                          CustomText.subHeadingText(
                            text: 'Terms & Conditions',
                            color: CustomColors.blackColor,
                          ),
                          CustomText.subHeadingText(
                            text: '&',
                            color: CustomColors.grey,
                          ),
                          CustomText.subHeadingText(
                            text: 'Privacy policy',
                            color: CustomColors.blackColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                //Don’t Have an Account?

                Wrap(
                  direction: Axis.horizontal,
                  //crossAxisAlignment: WrapCrossAlignment.start,
                  spacing: 4,
                  runSpacing: 2,
                  children: [
                    CustomText.subHeadingText(
                      text: 'Don’t Have an Account?',
                      color: CustomColors.blackColor,
                    ),
                    //Terms & Conditions

                    InkWell(
                      onTap: () {
                        NavigateUtils.pushNamed(context, Routes.signupScreen);
                      },
                      child: CustomText.subHeadingText(
                        text: 'Sign up',
                        color: CustomColors.buttonGreen,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
