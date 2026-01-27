import 'package:api_request/api_request.dart';

class ProfileAction extends ApiRequestAction<UserProfileResponse> {
  @override
  bool get authRequired => true;

  @override
  String get path => '/auth/profile';

  @override
  RequestMethod get method => RequestMethod.GET;

  @override
  ResponseBuilder<UserProfileResponse> get responseBuilder =>
      (json) => UserProfileResponse.fromJson(json);
}

class UserProfileResponse {
  String? id;
  String? displayName;
  String? username;
  List<String>? roles;
  bool? active;
  int? experienceYears;
  String? address;
  String? level;
  String? createdAt;
  String? updatedAt;

  UserProfileResponse.fromJson(Map<String, dynamic> json) {
    id = json['_id'] as String?;
    displayName = json['displayName'] as String?;
    username = json['username'] as String?;
    roles = (json['roles'] as List?)?.map((e) => e.toString()).toList();
    active = json['active'] as bool?;
    experienceYears = json['experienceYears'] as int?;
    address = json['address'] as String?;
    level = json['level'] as String?;
    createdAt = json['createdAt'] as String?;
    updatedAt = json['updatedAt'] as String?;
  }
}
