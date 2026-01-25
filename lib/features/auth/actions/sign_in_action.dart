import 'package:api_request/api_request.dart';

class SignInAction extends ApiRequestAction<SignInResponse> {
  @override
  bool get authRequired => true;

  @override
  String get path => 'auth/login';

  @override
  RequestMethod get method => RequestMethod.POST;

  @override
  ResponseBuilder<SignInResponse> get responseBuilder =>
      (json) => SignInResponse.fromJson(json);
}

class SignInResponse {
  String? id;
  String? accessToken;
  String? refreshToken;
  String? errormessage;

  SignInResponse.fromJson(Map<String, dynamic> json) {
    id = json['_id'] as String?;
    accessToken = json['access_token'] as String?;
    refreshToken = json['refresh_token'] as String?;
    errormessage = json['message'] as String?;
  }
}
