import 'package:flutter/material.dart';
import 'package:oohapp/responsive_screen/responsive.dart';

import '../b_splash_screen/splash_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: SplashScreen(),
      tablet: SplashScreen(),
      desktop: SplashScreen(),
    );
  }
}
