import 'package:app_features/app_features.dart';
import 'package:tasky/features/home/pages/settings_page.dart';
import 'bloc/home_bloc.dart';
import '../../config/app_config.dart';
import 'home_page.dart';

class HomeFeature extends Feature {
  @override
  void get dependencies => {getIt.registerLazySingleton(() => HomeBloc())};
  @override
  String get name => '/home';
  String get settingPage => '/settings';
  static HomeFeature get to => AppFeatures.get();
  @override
  List<GoRoute> get routes => [
    GoRoute(path: name, name: name, builder: (_, state) => const HomePage()),
    GoRoute(
      path: settingPage,
      name: settingPage,
      builder: (_, state) => const SettingsPage(),
    ),
  ];

  void goToSettingsPage() => push(name: settingPage);
}
