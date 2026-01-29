import 'package:api_request/api_request.dart';

class GetTasksAction extends ApiRequestAction<TaskActionResponse> {
  @override
  bool get authRequired => true;
  @override
  String get path => 'todos?';
  @override
  RequestMethod get method => RequestMethod.GET;
  @override
  ResponseBuilder<TaskActionResponse> get responseBuilder =>
      (json) => TaskActionResponse.fromJson(json);
}

class TaskActionResponse {
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

  TaskActionResponse.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    image = json['image'];
    title = json['title'];
    desc = json['desc'];
    priority = json['priority'];
    status = json['status'];
    user = json['user'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    version = json['__v'];
  }
}
