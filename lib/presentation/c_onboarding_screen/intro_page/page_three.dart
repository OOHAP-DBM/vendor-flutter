import 'package:oohapp/core/app_export.dart';

import '../../../responsive_screen/responsive.dart';
import '../../../widgets/scale_size.dart';

class PageThree extends StatelessWidget {
  const PageThree({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScaleSize.height(100),
      width: ScaleSize.width(100),
      child: Stack(
       // alignment: Alignment.topCenter,
        children: [
          SizedBox(
            height: ScaleSize.height(100),
            width: ScaleSize.width(100),
            child: Image.asset(
              ImageConstant.test,
              fit: Responsive.isMobile(context)
                  ? BoxFit.fitHeight
                  : Responsive.isTablet(context)
                      ? BoxFit.fill
                      : BoxFit.cover,
            ),
          ),
          Container(
            height: ScaleSize.height(100),
            width: ScaleSize.width(100),
            decoration:
                const BoxDecoration(gradient: CustomColors.blackGradient),
          ),
       /*   CustomSvgImageView(
            width: ScaleSize.width(80),
            svgPath: ImageConstant.primaryLogo,
            fit: BoxFit.contain,
          ),
          Positioned(
            bottom: ScaleSize.height(20),
            child: CustomSvgImageView(
              width: ScaleSize.width(80),
              svgPath: ImageConstant.stackLogo,
              fit: BoxFit.contain,
            ),
          ),*/
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomSvgImageView(
                    width: ScaleSize.width(80),
                    svgPath: ImageConstant.primaryLogo,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  /* const Text(
                    'Get More Insightful Data',
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
                  ),*/
                  CustomText.primaryTitle(text: 'Get More Insightful Data'),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomText.bodyText(
                      text:
                          "Get more insightful data with OOHAPP's AI-based analytics to measure the performance of your campaigns.",
                      textAlign: TextAlign.center),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
