import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/app/models/user_model.dart';
import 'package:tasky/app/utils/notification_util.dart';
import 'package:tasky/config/app_config.dart';
import 'package:tasky/core/app_storage.dart';
import 'package:tasky/features/auth/actions/sign_in_action.dart';
import 'package:tasky/features/auth/actions/sign_up_action.dart';
import 'package:tasky/features/auth/bloc/auth_state.dart';
import 'package:tasky/features/home/home_feature.dart';

class AuthBloc extends Cubit<AuthState> {
  AuthBloc() : super(const AuthState());
  static AuthBloc to = getIt.get();
  void setIsLoading(bool isLoading) {
    emit(state.copyWith(isLoading: isLoading));
  }

  void setErrorMessage(String? errorMessage) {
    emit(state.copyWith(errorMessage: errorMessage));
  }

  Future<void> signIn({required String phone, required String password}) async {
    await SignInAction()
        .listen(
          onStart: () => NotificationUtil.showLoading(),
          onDone: () => NotificationUtil.hideLoading(),

          onSuccess: (response) {
            emit(
              state.copyWith(
                user: UserModel(
                  id: response?.id,
                  accessToken: response?.accessToken,
                  refreshToken: response?.refreshToken,
                ),
              ),
            );
            AppStorage.to.setToken(response?.accessToken);
            HomeFeature.to.go();
          },
          onError: (error) {
            NotificationUtil.showError(error.message);
          },
        )
        .whereMap({'phone': phone, 'password': password})
        .execute();
  }

  Future<void> signUp({
    required String phone,
    required String passWord,
    required String displayName,
    required int numberOfExperience,
    required String level,
    required String address,
  }) async {
    await SignUpAction()
        .listen(
          onStart: () => NotificationUtil.showLoading(),
          onDone: () => NotificationUtil.hideLoading(),

          onSuccess: (reponse) {
            emit(
              state.copyWith(
                user: UserModel(
                  id: reponse?.id,
                  accessToken: reponse?.accessToken,
                  refreshToken: reponse?.refreshToken,
                ),
              ),
            );
          },
          onError: (error) {
            NotificationUtil.showError(error.message);
          },
        )
        .whereMap({
          "phone": phone,
          "password": passWord,
          "displayName": displayName,
          "experienceYears": numberOfExperience,
          "level": level == "Mid" ? "midLevel" : level.toLowerCase(),
          "address": address,
        })
        .execute();
  }
}
