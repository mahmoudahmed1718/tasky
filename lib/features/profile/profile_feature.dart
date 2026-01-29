import 'package:app_features/app_features.dart';
import 'package:tasky/config/app_config.dart';
import 'package:tasky/features/profile/bloc/profile_bloc.dart';
import 'package:tasky/features/profile/profile_page.dart';

class ProfileFeature extends Feature {
  @override
  void get dependencies => {getIt.registerLazySingleton(() => ProfileBloc())};

  @override
  String get name => '/profile';
  static ProfileFeature get to => AppFeatures.get();
  @override
  List<GoRoute> get routes => [
    GoRoute(
      path: name,
      name: name,
      builder: (context, state) => const ProfilePage(),
    ),
  ];
}
