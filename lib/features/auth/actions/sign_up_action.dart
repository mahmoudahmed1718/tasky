import 'package:api_request/api_request.dart';

class SignUpAction extends ApiRequestAction<SignUpResponse> {
  @override
  bool get authRequired => false;
  @override
  String get path => 'auth/register';
  @override
  RequestMethod get method => RequestMethod.POST;
  @override
  ResponseBuilder<SignUpResponse> get responseBuilder =>
      (json) => SignUpResponse.formJson(json);
}

class SignUpResponse {
  String? id;
  String? displayName;
  String? message;
  String? refreshToken;
  String? accessToken;

  SignUpResponse.formJson(Map<String, dynamic> json) {
    id = json['_id'];
    displayName = json['displayName'];
    message = json['message'];
    refreshToken = json['refresh_token'];
    accessToken = json['access_token'];
  }
}
