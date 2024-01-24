  import 'package:oohapp/core/app_export.dart';
  import 'package:oohapp/widgets/custom_buttons/custom_text_btn.dart';
  import 'package:pin_code_fields/pin_code_fields.dart';

  class LoginOtpScreen extends StatefulWidget {
    const LoginOtpScreen({Key? key}) : super(key: key);

    @override
    State<LoginOtpScreen> createState() => _OtpScreenState();
  }

  class _OtpScreenState extends State<LoginOtpScreen> {
    int runningTimer = 5;
    bool isVerify = false;
    late Timer? timer;

    @override
    void initState() {
      super.initState();
      isOtp();
    }

    void isOtp() {
      isVerify = true;
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          if (runningTimer > 0) {
            runningTimer--;
          } else {
            isVerify = false;
          }
        });
      });
    }

    @override
    void dispose() {
      timer?.cancel();
      super.dispose();
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          title: 'Verification',
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
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 18.0),
            child: SizedBox(
              height: ScaleSize.height(85),
              width: ScaleSize.width(100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText.headlineText(
                    text: 'Verify Mobile Number',
                    color: CustomColors.blackColor,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomText.bodyText(
                    text: 'Enter the 4-digit code sent to you at',
                    color: CustomColors.liteBlack,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomText.bodyText(
                    text: '+91-1234567890',
                    color: CustomColors.blackColor,
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  Container(
                    width: ScaleSize.width(70),
                    // padding: const EdgeInsets.all(16.0),
                    alignment: Alignment.topLeft,
                    child: PinCodeTextField(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      enablePinAutofill: true,
                      appContext: context,
                      length: 4,
                      onChanged: (value) {
                        // Handle value change
                      },
                      onCompleted: (value) {
                        // Handle complete pin input
                      },
                      keyboardType: TextInputType.number,
                      pinTheme: PinTheme(
                        inactiveColor: CustomColors.grey,
                        activeColor: CustomColors.blackColor,
                        errorBorderColor: CustomColors.errorColor,
                        selectedColor: CustomColors.blackColor,
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 50,
                        fieldWidth: 50,
                        activeFillColor: Colors.white,
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 15,
                  ),
                  // timer for the resend otp
                  CustomText.bodyText(
                    //text: '2:00',
                    text: '$runningTimer s',
                    color: CustomColors.blackColor,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextBtn(
                    onTap: () {},
                    text: 'Resend OTP',
                    alignment: Alignment.topLeft,
                  ),
             
                  const Spacer(),
                  CustomButton(
                    onTap: () {
                      NavigateUtils.pushNamedReplacement(context, Routes.homepagescreen);
                    },
                    text: 'Verify',
                    backgroundColor:
                        isVerify ? CustomColors.grey : CustomColors.buttonColor,
                  ),
          
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
