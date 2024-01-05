import 'package:oohapp/core/app_export.dart';

class CreateProfileScreen extends StatelessWidget {
  const CreateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //   extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(
        title: 'Create your Profile',
        centerTitle: true,
        elevation: 1,
      //  backgroundColor: Colors.grey.shade100,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
        ),
      ),

      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Container(
          height: ScaleSize.height(88),
          //  height: ScaleSize.height(100),
          // height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 14.0),
          width: ScaleSize.width(100),
          child: IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 56,
                        backgroundColor: CustomColors.liteGrey,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0), // Border radius
                          child: ClipOval(
                            child: CustomImageView(
                              width: 200,
                              height: 200,
                              fit: BoxFit.fill,
                              imagePath: ImageConstant.baby,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 7,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(
                                  50,
                                ),
                              ),
                              color: CustomColors.liteGrey,
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(2, 4),
                                  color: Colors.black.withOpacity(
                                    0.3,
                                  ),
                                  blurRadius: 3,
                                ),
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: InkWell(
                              onTap: () {
                                CustomSnackBar(
                                        color: Colors.pink,
                                        text: 'Upload button clicked',
                                        second: 1,
                                        icon: Icons.camera)
                                    .showSnackBar(context);
                              },
                              child: const Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.black,
                                size: 15,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const CustomTextFormField(
                  placeholder: 'First Name*',
                  // maxLength: 10,
                  // keyboardType: TextInputType.number,
                  hintText: 'Enter first Name',
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const CustomTextFormField(
                  placeholder: 'First Name*',
                  // maxLength: 10,
                  // keyboardType: TextInputType.number,
                  hintText: 'Enter first Name',
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const CustomTextFormField(
                  placeholder: 'Mobile Number*',
                  // maxLength: 10,
                  // keyboardType: TextInputType.number,
                  hintText: '1234567890',
                ),

                const SizedBox(
                  height: 15.0,
                ),
                const CustomTextFormField(
                  placeholder: 'Email Address*',
                  // maxLength: 10,
                  // keyboardType: TextInputType.number,
                  hintText: 'Enter email address',
                ),

                const SizedBox(
                  height: 15.0,
                ),
                const Spacer(),
                CustomButton(
                    backgroundColor: CustomColors.inactiveButton,
                    onTap: () {
                      NavigateUtils.pushNamed(context, Routes.createPasswordScreen);
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
