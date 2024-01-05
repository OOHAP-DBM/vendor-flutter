import 'package:oohapp/core/app_export.dart';
import 'cubit/splash_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashCubit, SplashState>(
      builder: (context, state) {
        if (context != null) {
          Future.delayed(const Duration(seconds: 10), () {
            NavigateUtils.pushNamedReplacement(
                context, Routes.onboardingScreen);
          });
        }

        return Scaffold(
          backgroundColor: Colors.white,
          body: SizedBox(
            width: double.infinity,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: CustomImageView(
                      imagePath: ImageConstant.logoSp,
                      fit: BoxFit.contain,
                      width: double.infinity,
                    ),
                  )
                  /* const Text(
                    'Welcome to',
                    style: TextStyle(
                        color: CustomColors.linkColor,
                        fontSize: 22,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                   CustomImageView(
                    svgPath: ImageConstant.logoSplash,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'A platform that makes your marketing fit the persuasion.',
                    style: TextStyle(
                      color: CustomColors.blackColor,
                      fontSize: 14,
                    ),
                    maxLines: 2,
                    softWrap: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),*/
                  /*  CustomButton(
                      onPressed: () {
                        if (state == SplashState.initial) {
                          NavigateUtils.pushNamedReplacement(
                              context, Routes.onboardingScreen);
                        }
                      },
                      text: 'GOTO')*/
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

/*

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  bool isOnLeft = true;
  late AnimationController _animationController;

  late Animation<double> _sizeAnimation;

  Future<void> _someAsyncTask() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    _sizeAnimation = Tween<double>(begin: 20.0, end: 200.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOutQuint,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FutureBuilder(
                  future: _someAsyncTask(),
                  builder: (context, snapshot) {
                    return AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        return Container(
                          alignment: isOnLeft
                              ? Alignment.centerLeft
                              : Alignment.centerRight,
                          height: _sizeAnimation.value,
                          width: _sizeAnimation.value,
                          child: CustomImageView(
                            svgPath: ImageConstant.logoOne,
                            */
/*        height: 50,
                      width: 100,*/ /*

                            fit: BoxFit.contain,
                          ),
                        );
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 80,
                ),
                CustomButton(
                  onPressed: () {
                    setState(() {
                      isOnLeft = !isOnLeft;
                    });
                    if (_animationController.status ==
                        AnimationStatus.completed) {
                      _animationController.reverse();
                    } else {
                      _animationController.forward();
                    }
                    Timer(const Duration(seconds: 3), () {
                      setState(() {
                        isOnLeft = !isOnLeft;
                      });
                    });
                  },
                  text: 'ANIMATE',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
*/
