import 'package:oohapp/presentation/c_onboarding_screen/cubit/onboarding_cubit.dart';

import '../core/app_export.dart';
import '../presentation/b_splash_screen/cubit/splash_cubit.dart';

class CustomBlocProvider extends StatelessWidget {
  const CustomBlocProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(create: (context) => InternetCubit()),
        BlocProvider<SplashCubit>(create: (context) => SplashCubit()),
        BlocProvider<OnboardingCubit>(create: (context) => OnboardingCubit()),
      ],
      child: child,
    );
  }
}
