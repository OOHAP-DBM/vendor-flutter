import 'package:oohapp/core/app_export.dart';
import 'package:oohapp/presentation/e_home_page/home_page.dart';
import 'package:oohapp/widgets/custom_appbar/custom_appbar.dart';
import 'package:oohapp/widgets/custom_buttons/custom_button.dart';
import 'package:oohapp/widgets/custom_buttons/custom_text_btn.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class SignupOtpScreen extends StatefulWidget {
  const SignupOtpScreen({Key? key}) : super(key: key);

  @override
  State<SignupOtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<SignupOtpScreen> {
  int runningTimer = 5;
  bool isVerify = false;
  late Timer? timer;
  String otpValue = ''; // Add this line
  String errorMessage = '';

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

  void _verifyOtp() {
    if (otpValue.length == 4) {
  
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(), // Replace with actual next page
        ),
      );
    } else {
      // Set error message if OTP is not complete.
      setState(() {
        errorMessage = 'Please fill all the fields with the OTP';
      });
    }
  }

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 18.0),
          child: SizedBox(
            height: size.height * 0.85,
            width: size.width,

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
                  width: size.width * 0.70,
                  // padding: const EdgeInsets.all(16.0),
                  alignment: Alignment.topLeft,
                  child: PinCodeTextField(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    enablePinAutofill: true,
                    appContext: context,
                    length: 4,
                    onChanged: (value) {
                      setState(() {
                        otpValue =
                            value; 
                        if (value.length == 4) {
                          isVerify = true; 
                        } else {
                          isVerify = false; 
                        }
                        errorMessage =
                            ''; 
                      });
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
       
                CustomText.bodyText(
                  //text: '2:00',
                  text: '$runningTimer s',
                  color: CustomColors.blackColor,
                ),
                const SizedBox(
                  height: 15,
                ),
                if (errorMessage.isNotEmpty)
                  SizedBox(
                    height: 20,
                    child: Text(
                      errorMessage,
                      style: TextStyle(color: CustomColors.errorColor),
                    ),
                  ),
                const SizedBox(
                  height: 15,
                ),

                CustomTextBtn(
                  onPressed: () {},
                  text: 'Resend OTP',
                  alignment: Alignment.topLeft,
                ),
           
                const Spacer(),
                CustomButton(
                  onTap: () {
                _verifyOtp();
                  },
                  text: 'Verify',
                  backgroundColor: isVerify && otpValue.length == 4
                      ? CustomColors.buttonColor
                      : CustomColors.grey,
                ),
                // Button will not clickable until fill the box
              ],
            ),
          ),
        ),
      ),
    );
  }
}
