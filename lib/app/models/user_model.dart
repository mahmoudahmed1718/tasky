class UserModel {
  String? id;
  String? accessToken;
  String? refreshToken;
  UserModel({this.id, this.accessToken, this.refreshToken});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'] as String?;
    accessToken = json['access_token'] as String?;
    refreshToken = json['refresh_token'] as String?;
  }
}
