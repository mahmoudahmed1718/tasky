import 'package:app_features/app_features.dart';
import 'package:tasky/features/tasks/pages/create_new_task_page.dart';
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
  String get createNewTaskPage => '/createNewTast';
  static TasksFeature get to => AppFeatures.get();
  @override
  List<GoRoute> get routes => [
    GoRoute(path: name, name: name, builder: (_, state) => const TasksPage()),
    GoRoute(
      path: settingPage,
      name: settingPage,
      builder: (_, state) => const SettingsPage(),
    ),
    GoRoute(
      path: createNewTaskPage,
      name: createNewTaskPage,
      builder: (_, state) => const CreateNewTaskPage(),
    ),
  ];

  void goToSettingsPage() => push(name: settingPage);
  void goToCreateNewTaskPage() => push(name: createNewTaskPage);
}
