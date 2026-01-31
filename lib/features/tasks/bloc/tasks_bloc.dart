// ignore: file_names
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/app/models/task_model.dart';
import 'package:tasky/app/utils/notification_util.dart';
import 'package:tasky/core/app_storage.dart';
import 'package:tasky/features/tasks/actions/create_task_acion.dart';

import '../../tasks/bloc/tasks_state.dart';

class TaskBloc extends Cubit<TasksState> {
  TaskBloc() : super(const TasksState());

  Future<void> addTask({
    required String title,
    required String description,
    required String date,
    required String proirty,
    String? imageUrl,
  }) async {
    await CreateTaskAcion()
        .listen(
          onStart: () => NotificationUtil.showLoading(),
          onDone: () => NotificationUtil.hideLoading(),
          onSuccess: (response) {
            emit(state.copyWith(taskModel: TaskModel.fromJson(response!)));
          },
          onError: (error) {
            NotificationUtil.showError(error.message);
          },
        )
        .withHeader("authorization", AppStorage.to.getToken())
        .whereMap({
          "title": title,
          "description": description,
          "date": date,
          "proirty": proirty,
          "imageUrl": imageUrl,
        })
        .execute();
  }
}
