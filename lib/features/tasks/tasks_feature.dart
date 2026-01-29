import 'package:app_features/app_features.dart';
import 'package:tasky/features/tasks/pages/settings_page.dart';
import 'bloc/tasks_bloc.dart';
import '../../config/app_config.dart';
import 'tasks_page.dart';

class TasksFeature extends Feature {
  @override
  void get dependencies => {getIt.registerLazySingleton(() => TaskBloc())};
  @override
  String get name => '/home';
  String get settingPage => '/settings';
  static TasksFeature get to => AppFeatures.get();
  @override
  List<GoRoute> get routes => [
    GoRoute(path: name, name: name, builder: (_, state) => const TasksPage()),
    GoRoute(
      path: settingPage,
      name: settingPage,
      builder: (_, state) => const SettingsPage(),
    ),
  ];

  void goToSettingsPage() => push(name: settingPage);
}
