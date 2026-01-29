import 'package:api_request/api_request.dart';
import 'package:tasky/features/tasks/actions/get_tasks_action.dart';

class CreateTaskAcion extends ApiRequestAction<TaskActionResponse> {
  @override
  bool get authRequired => true;
  @override
  String get path => 'todos';

  @override
  RequestMethod get method => RequestMethod.POST;

  @override
  ResponseBuilder<TaskActionResponse> get responseBuilder =>
      (json) => TaskActionResponse.fromJson(json);
}
