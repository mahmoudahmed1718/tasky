import 'package:equatable/equatable.dart';
import 'package:tasky/app/models/profile_model.dart';

class ProfileState extends Equatable {
  const ProfileState({this.isloading, this.errorMessage, this.profileModel});
  final bool? isloading;
  final String? errorMessage;
  final ProfileModel? profileModel;

  ProfileState copyWith({
    bool? isloading,
    String? errorMessage,
    ProfileModel? profileModel,
  }) => ProfileState(
    isloading: isloading ?? this.isloading,
    errorMessage: errorMessage ?? this.errorMessage,
    profileModel: profileModel ?? this.profileModel,
  );
  @override
  List<Object?> get props => [isloading, errorMessage, profileModel];
}
