import 'package:oohapp/core/constants/app_constant.dart';
import 'package:oohapp/presentation/a_main_screen/main_screen.dart';
import 'package:oohapp/presentation/add_hoarding/first_add_hoarding_page.dart/add_hoarding_page.dart';
import 'package:oohapp/presentation/add_hoarding/second_hoarding_page/second_hoarding_page.dart';

import 'package:oohapp/presentation/c_onboarding_screen/cubit/charcter_count/character_count_cubit.dart';
import 'package:oohapp/presentation/d_authentication/login_screen/login_otp_screen/login_otp_screen.dart';
import 'package:oohapp/presentation/d_authentication/login_screen/login_screen.dart';
import 'package:oohapp/presentation/d_authentication/login_screen/login_with_password_screen/login_with_password_screen.dart';
import 'package:oohapp/presentation/d_authentication/sign_up_screen/create_password_screen/create_password_screen.dart';
import 'package:oohapp/presentation/d_authentication/sign_up_screen/create_profile_screen/create_profile_screen.dart';
import 'package:oohapp/presentation/d_authentication/sign_up_screen/signup_otp_screen/signup_otp_screen.dart';
import 'package:oohapp/presentation/d_authentication/sign_up_screen/signup_screen.dart';
import '../core/app_export.dart';
import '../presentation/b_splash_screen/splash_screen.dart';
import '../presentation/c_onboarding_screen/onboarding_screen.dart';
import '../presentation/e_home_page/dashboard_screen/dashboard_screen.dart';

class RoutesGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.mainScreen:
        return MaterialPageRoute(
            builder: (_) => const MainScreen(),
        );
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case Routes.onboardingScreen:
        return MaterialPageRoute(
          builder: (_) => OnBoardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case Routes.loginOtpScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginOtpScreen(),
        );
      case Routes.loginWithPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginWithPasswordScreen(),
        );
      case Routes.signupScreen:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
        );
      case Routes.signupOtpScreen:
        return MaterialPageRoute(
          builder: (_) => const SignupOtpScreen(),
        );
      case Routes.createPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => const CreatePasswordScreen(),
        );
      case Routes.createProfileScreen:
        return MaterialPageRoute(
          builder: (_) => const CreateProfileScreen(),
        );
      case Routes.dashboardScreen:
        return MaterialPageRoute(
          builder: (_) => const DashboardScreen(),
        );
        case Routes.addhoardingScreen:
          return MaterialPageRoute(
              builder: (_) => BlocProvider(
                create: (context) => CharacterCountCubit(),
                child: const AddHoardingScreen(),
              ),
            );
            case Routes.secondhoardingScreen:
            return MaterialPageRoute(
              builder: (_)=> const SecondAddHoardingPage()
            );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(AppConstant.noScreen),
            ),
          ),
        );
    }
  }
}
