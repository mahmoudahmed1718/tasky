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

  ProfileModel.fromJson(Map<String, dynamic> json) {
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
