import 'package:oohapp/core/app_export.dart';

import '../../../responsive_screen/responsive.dart';
import '../../../widgets/scale_size.dart';

class PageOne extends StatelessWidget {
  const PageOne({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

     Size size = MediaQuery.of(context).size;
    return SizedBox(
      height:size.height,
      width:size.width,
      child: Stack(
        children: [
          SizedBox(
            height:size.height,
            width:size.width,
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
            height:size.height,
            width:size.width,
            decoration:  const BoxDecoration(
              gradient: CustomColors.blackGradient
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomSvgImageView(
                      width: size.width * 0.80,
                      svgPath: ImageConstant.primaryLogo,
                      fit: BoxFit.contain),
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
