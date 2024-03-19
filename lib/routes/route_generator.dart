import 'package:flutter/cupertino.dart';
import 'package:oohapp/all_cubit_folder/additional_ui_second_hoarding/cubit.dart';
import 'package:oohapp/all_cubit_folder/final_add_hoarding_first_page/cubit.dart';
import 'package:oohapp/all_cubit_folder/final_add_hoarding_second_page/cubit.dart';
import 'package:oohapp/all_cubit_folder/first_add_hoarding/cubit.dart';
import 'package:oohapp/all_cubit_folder/first_location_entry_page/cubit.dart';
import 'package:oohapp/all_cubit_folder/log_in_screen/cubit.dart';

import 'package:oohapp/all_cubit_folder/second_add_haording/cubit.dart';
import 'package:oohapp/core/constants/app_constant.dart';

import 'package:oohapp/presentation/a_main_screen/main_screen.dart';
import 'package:oohapp/presentation/add_hoarding/add_hoarding_final_page/add_hoarding_final_page_first.dart';
import 'package:oohapp/presentation/add_hoarding/add_hoarding_final_page/add_hoarding_final_second_page/add_hoarding_second_final_page.dart';
import 'package:oohapp/presentation/add_hoarding/first_add_hoarding_page.dart/add_hoarding_page.dart';

import 'package:oohapp/presentation/add_hoarding/getting_started/first_page_getting_started/first_page_getting_started.dart';
import 'package:oohapp/presentation/add_hoarding/hoarding_location/first_hoarding_location_page.dart';
import 'package:oohapp/presentation/add_hoarding/hoarding_location/hoarding_location_page_entry/first_hoarding_location_entry_Page/first_hoarding_location_entry_page.dart';
import 'package:oohapp/presentation/add_hoarding/hoarding_location/second_location_hoarding_page.dart';

import 'package:oohapp/presentation/add_hoarding/second_hoarding_page/second_hoarding_page.dart';
import 'package:oohapp/presentation/add_hoarding/upload_hoarding_logo/add_hoarding_calendar/add_hoarding_calendar_page.dart';
import 'package:oohapp/presentation/add_hoarding/upload_hoarding_logo/upload_hoarding_logo_page.dart';
import 'package:oohapp/presentation/add_hoarding/upload_hoarding_logo/upload_hoarding_video/cubit/cubit.dart';
import 'package:oohapp/presentation/add_hoarding/upload_hoarding_logo/upload_hoarding_video/upload_hoarding_video_page.dart';
import 'package:oohapp/presentation/add_hoarding/upload_hoarding_logo/widgets/cubit/cubit.dart';

import 'package:oohapp/presentation/d_authentication/login_screen/login_otp_screen/login_otp_screen.dart';
import 'package:oohapp/presentation/d_authentication/login_screen/login_screen.dart';
import 'package:oohapp/presentation/d_authentication/login_screen/login_with_password_screen/login_with_password_screen.dart';
import 'package:oohapp/presentation/d_authentication/sign_up_screen/create_password_screen/create_password_screen.dart';
import 'package:oohapp/presentation/d_authentication/sign_up_screen/create_profile_screen/create_profile_screen.dart';
import 'package:oohapp/presentation/d_authentication/sign_up_screen/signup_otp_screen/signup_otp_screen.dart';
import 'package:oohapp/presentation/d_authentication/sign_up_screen/signup_screen.dart';
import 'package:oohapp/presentation/e_home_page/a_hoarding/empty_hoarding_page.dart';
import 'package:oohapp/presentation/e_home_page/a_hoarding/hoarding_list/final_rating_and%20_reviews/final_rating_and_review_page.dart';
import 'package:oohapp/presentation/e_home_page/a_hoarding/hoarding_list/hoarding_detail_page.dart';
import 'package:oohapp/presentation/e_home_page/a_hoarding/hoarding_list/hoarding_list_page.dart';
import 'package:oohapp/presentation/e_home_page/home_page.dart';
import '../core/app_export.dart';
import '../presentation/b_splash_screen/splash_screen.dart';
import '../presentation/c_onboarding_screen/onboarding_screen.dart';
import '../presentation/e_home_page/dashboard_screen/dashboard_screen.dart';

class RoutesGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.mainScreen:
        return CupertinoPageRoute(
          builder: (_) => const MainScreen(),
        );
      case Routes.splashScreen:
        return CupertinoPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case Routes.onboardingScreen:
        return CupertinoPageRoute(
          builder: (_) => OnBoardingScreen(),
        );
      case Routes.loginScreen:
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LogInScreenCubit(),
            child: const LoginScreen(),
          ),
        );
      case Routes.loginOtpScreen:
        return CupertinoPageRoute(
          builder: (_) => const LoginOtpScreen(),
        );
      case Routes.loginWithPasswordScreen:
        return CupertinoPageRoute(
          builder: (_) => const LoginWithPasswordScreen(),
        );
      case Routes.signupScreen:
        return CupertinoPageRoute(
          builder: (_) => const SignUpScreen(),
        );
      case Routes.signupOtpScreen:
        return CupertinoPageRoute(
          builder: (_) => const SignupOtpScreen(),
        );
      case Routes.createPasswordScreen:
        return CupertinoPageRoute(
          builder: (_) => const CreatePasswordScreen(),
        );
      case Routes.createProfileScreen:
        return CupertinoPageRoute(
          builder: (_) => const CreateProfileScreen(),
        );
      case Routes.homepagescreen:
        return CupertinoPageRoute(
          builder: (_) => const HomePage(),
        );
      case Routes.dashboardScreen:
        return CupertinoPageRoute(
          builder: (_) => const DashboardScreen(),
        );

      case Routes.gettingstartedfirstScreen:
        return CupertinoPageRoute(
            builder: (_) => const GettingStartedFirstPage());

      case Routes.emptyhoardingpage:
        return CupertinoPageRoute(builder: (_) => const EmptyHoardingPage());
      case Routes.hoardinglistscreen:
        return CupertinoPageRoute(builder: (_) => MyHordingListPage());

      case Routes.addhoardingScreen:
        return CupertinoPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => AddHoardingScreenCubit(),
                  child: const AddHoardingScreen(),
                ));
      case Routes.secondhoardingScreen:
        return CupertinoPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => SecondHoardingScreenCubit(),
                  child: const SecondAddHoardingPage(),
                ));
      case Routes.firsthoardinglocationScreen:
        return CupertinoPageRoute(builder: (_) => FirstHoardingLocationPage());
 
      case Routes.secondhoardinglocationScreen:
        return CupertinoPageRoute(
            builder: (_) => const SecondLocationHoardingPage());
      case Routes.fisthoardinglocationentryScreen:
        return CupertinoPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => LocationEntryScreenCubit(),
                  child: const FirstHoardingLocationEntryPage(),
                ));
      case Routes.finalfirstaddhoardingScreen:
        return CupertinoPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => FinalFirstAddHoardingScreenCubit(),
                  child: const FinalAddHoardingFirstPage(),
                ));
      case Routes.finalsecondaddhoardingScreeen:
        return CupertinoPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<FinalSecondAddHoardingScreenCubit>(
                create: (context) => FinalSecondAddHoardingScreenCubit(),
              ),
              BlocProvider<FinalAddHoardingAdditionalScreenCubit>(
                create: (context) => FinalAddHoardingAdditionalScreenCubit(),
              ),
            ],
            child: FinalAddHoardingSecondPage(),
          ),
        );

      case Routes.uploadimagehoardingpage:
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ImageCubit(),
            child: const UploadHoardingLogoPage(),
          ),
        );
      case Routes.uploadhoardingvideopage:
        return CupertinoPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => MediaCubit(),
                  child: const UploadHoardingVideoPage(),
                ));
      case Routes.uploadhoardingcalendarpage:
        return CupertinoPageRoute(
          builder: (_) => const AddHoardingCalendarPage(),
        );
      default:
        return CupertinoPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(AppConstant.noScreen),
            ),
          ),
        );
    }
  }
}
