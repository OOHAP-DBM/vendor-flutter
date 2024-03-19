  import '../../../../core/app_export.dart';

class GettingStartedFirstPage extends StatefulWidget {
  const GettingStartedFirstPage({super.key});

  @override
  State<GettingStartedFirstPage> createState() =>
      _GettingStartedFirstPageState();
}

class _GettingStartedFirstPageState extends State<GettingStartedFirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Getting Started',
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
        padding: const EdgeInsetsDirectional.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText.secondaryTitle(
              text: 'Let’s get started listing your hoarding',
              color: CustomColors.blackColor,
            ),
            const SizedBox(
              height: 7,
            ),
            CustomText.calloutText(
              text:
                  "It’ll take time to setup your listing. We’ll help you wherever you need it.",
                   textAlign: TextAlign.left, 
                  
              color: CustomColors.blackColor,
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              width: 343,
              height: 343,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: OvalBorder(),
              ),
              child: SizedBox(
                width: 255.88,
                height: 233.51,
                child: CustomImageView(
                  fit: BoxFit.fill,
                  imagePath: ImageConstant.hoarding,
                ),
              ),
            ),
            SizedBox(
              height: 167,
            ),
            CustomButton(
              onTap: () {
                NavigateUtils.pushNamedReplacement(
                    context, Routes.firsthoardinglocationScreen);
              },
              text: 'Start Listing',
              backgroundColor: Color(0xFF282C3E),
            ),
          ],
        ),
      ),
    );
  }
}
