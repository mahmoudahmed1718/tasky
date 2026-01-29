import 'package:tasky/features/profile/action/profile_action.dart';

class ProfileModel {
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
  ProfileModel({
    this.id,
    this.displayName,
    this.username,
    this.roles,
    this.active,
    this.experienceYears,
    this.address,
    this.level,
    this.createdAt,
    this.updatedAt,
  });

  ProfileModel.fromJson(UserProfileResponse json) {
    id = json.id;
    displayName = json.displayName;
    username = json.username;
    roles = json.roles;
    active = json.active;
    experienceYears = json.experienceYears;
    address = json.address;
    level = json.level;
    createdAt = json.createdAt;
    updatedAt = json.updatedAt;
  }
}
