import 'package:app_features/app_features.dart';
import 'package:tasky/config/app_config.dart';
import 'package:tasky/features/auth/bloc/auth_bloc.dart';
import 'package:tasky/features/auth/pages/sign_in_page.dart';

class AuthFeature extends Feature {
  @override
  void get dependencies => {getIt.registerLazySingleton(() => AuthBloc())};
  @override
  String get name => '/auth';
  static AuthFeature get to => AppFeatures.get();
  @override
  List<GoRoute> get routes => [
    GoRoute(path: name, name: name, builder: (_, state) => const SignInPage()),
  ];
  void goToSignInPage() => push(name: name);
}
