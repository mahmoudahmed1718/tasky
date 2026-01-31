import 'package:equatable/equatable.dart';
import 'package:tasky/app/models/task_model.dart';

class TasksState extends Equatable {
  const TasksState({this.error, this.isLoading, this.taskModel});
  final String? error;
  final bool? isLoading;
  final TaskModel? taskModel;

  TasksState copyWith({String? error, bool? isLoading, TaskModel? taskModel}) {
    return TasksState(
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      taskModel: taskModel ?? this.taskModel,
    );
  }

  @override
  List<Object?> get props => [error, isLoading, taskModel];
}
