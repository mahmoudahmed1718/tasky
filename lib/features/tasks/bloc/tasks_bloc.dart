// ignore: file_names
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../tasks/bloc/tasks_state.dart';

class TaskBloc extends Cubit<TasksState> {
  TaskBloc() : super(const TasksState());
}
