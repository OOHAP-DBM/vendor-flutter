import 'package:oohapp/core/app_export.dart';

class LoginWithPasswordScreen extends StatelessWidget {
  const LoginWithPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: 'Verification',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.20,
                  width: size.width * 0.50,
                  child: CustomSvgImageView(
                    svgPath: ImageConstant.vendorLogo,
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  //   height: ScaleSize.height(80),
                  width: size.width,
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
                          text: 'Verify with password',
                          color: CustomColors.blackColor),
                      const SizedBox(
                        height: 5.0,
                      ),
                      CustomText.bodyText(
                          text: 'Enter your Email ID password to continue',
                          color: CustomColors.mediumGrey),
                      const SizedBox(
                        height: 35.0,
                      ),
                      //  CustomTextFormField(onPressed: onPressed, text: text, controller: controller),
                      const CustomTextFormField(
                        placeholder: 'Password*',
                        // maxLength: 10,
                        // keyboardType: TextInputType.number,
                        hintText: 'Enter password',
                        prefixIcon: Icon(Icons.key_rounded),
                        suffixIcon: Icon(Icons.visibility_off),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            NavigateUtils.pushNamed(
                                context, Routes.signupScreen);
                          },
                          child: CustomText.subHeadingText(
                            text: 'Forget password?',
                            textDecoration: TextDecoration.underline,
                            color: CustomColors.liteBlack,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      CustomButton(
                          backgroundColor: CustomColors.inactiveButton,
                          onTap: () {
                            // ********************    Goto Dashboard here ****************//

                            NavigateUtils.pushNamedReplacement(
                                context, Routes.dashboardScreen);
                          },
                          text: 'Continue'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
