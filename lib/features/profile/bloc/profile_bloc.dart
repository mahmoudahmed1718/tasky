import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/app/models/profile_model.dart';
import 'package:tasky/app/utils/notification_util.dart';
import 'package:tasky/config/app_config.dart';
import 'package:tasky/core/app_storage.dart';
import 'package:tasky/features/profile/action/profile_action.dart';
import 'package:tasky/features/profile/bloc/profile_state.dart';

class ProfileBloc extends Cubit<ProfileState> {
  ProfileBloc() : super(ProfileState());
  static ProfileBloc to = getIt.get();

  Future<void> getProfile() async {
    await ProfileAction()
        .listen(
          onStart: () => NotificationUtil.showLoading(),
          onDone: () => NotificationUtil.hideLoading(),
          onSuccess: (response) {
            emit(state.copyWith(profileModel: ProfileModel()));
          },
          onError: (error) {
            NotificationUtil.showError(error.message);
          },
        )
        .withHeader("authorization", AppStorage.to.getToken())
        .execute();
  }
}
