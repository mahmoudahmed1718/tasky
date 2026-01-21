import 'package:app_features/app_features.dart';
import 'package:tasky/features/splash/pages/onboarding_page.dart';
import 'bloc/splash_bloc.dart';
import '../../config/app_config.dart';
import 'splash_page.dart';

class SplashFeature extends Feature {
  @override
  void get dependencies => {getIt.registerLazySingleton(() => SplashBloc())};
  @override
  String get name => '/';
  String get onboardingPage => '/onboarding';

  static SplashFeature get to => AppFeatures.get();

  @override
  List<GoRoute> get routes => [
    GoRoute(path: name, name: name, builder: (_, state) => const SplashPage()),
    GoRoute(
      path: onboardingPage,
      name: onboardingPage,
      builder: (_, state) => const OnboardingPage(),
    ),
  ];
  void goToOnboardingPage() => push(name: onboardingPage);
}
