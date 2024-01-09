import 'package:flutter/services.dart';
import 'package:oohapp/core/app_export.dart';
import 'package:oohapp/presentation/add_hoarding/first_add_hoarding_page.dart/add_hoarding_page.dart';
import 'package:oohapp/presentation/b_splash_screen/splash_screen.dart';
import 'package:oohapp/presentation/c_onboarding_screen/intro_page/page_one.dart';
import 'package:oohapp/presentation/e_home_page/dashboard_screen/dashboard_screen.dart';
import 'package:oohapp/presentation/e_home_page/home_page.dart';
import 'package:oohapp/presentation/e_home_page/profile_screen/profile_screen.dart';
import 'package:oohapp/widgets/custom_bloc_provider.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = const ColorScheme.light();
    return CustomBlocProvider(
      child: MaterialApp(
        navigatorKey: ScaleSize.navigatorMediaQueryKey,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: colorScheme,
          scaffoldBackgroundColor: colorScheme.background,
          appBarTheme: AppBarTheme(
            //color: colorScheme.primary,
            iconTheme: IconThemeData(color: colorScheme.onPrimary),
          ),
         /* bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: colorScheme.primary,
            // Set bottom navigation bar color
            selectedItemColor: colorScheme.inversePrimary,
            // Set selected item color
            unselectedItemColor: colorScheme.onPrimary
                .withOpacity(0.5), // Set unselected item color
          ),*/
        ),
        //  initialRoute: Routes.splashScreen,
        //  onGenerateRoute: RoutesGenerator.generateRoutes,
        home: const AddHoardingScreen(),
         
       
        // home: const CreateProfileScreen(),
        //  home: LoginWithPasswordScreen(),
        // home: DashboardScreen(),
        // home: PageOne(),
        // home: ProfileScreen(),
      ),
    );
  }
}
