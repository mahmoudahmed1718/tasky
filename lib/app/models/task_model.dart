import 'package:tasky/features/tasks/actions/get_tasks_action.dart';

class TaskModel {
  String? id;
  String? image;
  String? title;
  String? desc;
  String? priority;
  String? status;
  String? user;
  String? createdAt;
  String? updatedAt;
  int? version;

  TaskModel({
    this.id,
    this.image,
    this.title,
    this.desc,
    this.priority,
    this.status,
    this.user,
    this.createdAt,
    this.updatedAt,
    this.version,
  });
  TaskModel.fromJson(TaskActionResponse json) {
    id = json.id;
    image = json.image;
    title = json.title;
    desc = json.desc;
    priority = json.priority;
    status = json.status;
    user = json.user;
    createdAt = json.createdAt;
    updatedAt = json.updatedAt;
    version = json.version;
  }
}
