import 'package:oohapp/core/app_export.dart';
import 'package:oohapp/presentation/c_onboarding_screen/cubit/onboarding_cubit.dart';
import 'package:oohapp/presentation/c_onboarding_screen/intro_page/page_one.dart';
import 'package:oohapp/presentation/c_onboarding_screen/intro_page/page_three.dart';
import 'package:oohapp/presentation/c_onboarding_screen/intro_page/page_two.dart';
import 'package:oohapp/responsive_screen/responsive.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          final bool showBackButton = state.currentPageIndex > 0;
          final bool changeColor = state.currentPageIndex < 1;
          final bool getStarted = state.currentPageIndex == 2;
          bool isButtonTapped = false;
          return SizedBox(
            height: ScaleSize.height(100),
            width: ScaleSize.width(100),
            child: Stack(children: [
              PageView(
                  controller: _controller,
                  onPageChanged: (index) {
                    context.read<OnboardingCubit>().onPageChanged(index);
                  },
                  children: const [
                    PageOne(),
                    PageTwo(),
                    PageThree(),
                  ]),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Align(
                  alignment: const Alignment(0, 0.75),
                  child: Container(
                    //  color: Colors.grey.withOpacity(0.3),
                    //  height: ScaleSize.height(10),
                    // This is actual height of button according to figma
                    //  width: ScaleSize.width(100),

                    child: getStarted
                        ? Visibility(
                            visible: getStarted,
                            child: CustomButton(
                              height: Responsive.isTablet(context)
                                  ? ScaleSize.height(10.0)
                                  : ScaleSize.height(5.66),
                              width: Responsive.isTablet(context)
                                  ? ScaleSize.width(60)
                                  : ScaleSize.width(90),
                              onTap: () {
                                NavigateUtils.pushNamedReplacement(context, Routes.loginScreen);
                              },
                              text: 'Get Started',
                            ))
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SmoothPageIndicator(
                                controller: _controller,
                                count: 3,
                                effect: const SlideEffect(
                                  activeDotColor: CustomColors.linkColor,
                                  dotColor: CustomColors.whiteColor,
                                  dotHeight: 8,
                                  dotWidth: 8,
                                ),
                              ),
                              const Spacer(),
                              if (showBackButton)
                                CircularButton(
                                  onTap: () {
                                    if (!isButtonTapped) {
                                      isButtonTapped = true;
                                      /*  context
                                          .read<OnboardingCubit>()
                                          .showBackButton(false);*/
                                      _controller
                                          .previousPage(
                                            duration: const Duration(
                                                milliseconds: 500),
                                            curve: Curves.easeInSine,
                                          )
                                          .whenComplete(
                                              () => isButtonTapped = false);
                                    }
                                  },
                                  backgroundColor: CustomColors.whiteColor,
                                  icon: Icons.arrow_back,
                                  iconColor: CustomColors.linkColor,
                                ),
                              SizedBox(
                                width: Responsive.isTablet(context)
                                    ? ScaleSize.width(2)
                                    : ScaleSize.width(8),
                              ),
                              CircularButton(
                                backgroundColor: changeColor
                                    ? Colors.transparent
                                    : CustomColors.whiteColor,
                                onTap: () {
                                  if (!isButtonTapped) {
                                    isButtonTapped = true;
                                    _controller
                                        .nextPage(
                                          duration: const Duration(
                                              milliseconds: 500),
                                          curve: Curves.easeInSine,
                                        )
                                        .whenComplete(
                                            () => isButtonTapped = false);
                                  }
                                },
                                icon: Icons.arrow_forward,
                                iconColor: changeColor
                                    ? Colors.white
                                    : CustomColors.linkColor,
                              ),
                            ],
                          ),
                  ),
                ),
              )
            ]),
          );
        },
      ),
    );
  }
}
