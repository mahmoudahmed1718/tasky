import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/app/models/user_model.dart';
import 'package:tasky/app/utils/notification_util.dart';
import 'package:tasky/config/app_config.dart';
import 'package:tasky/features/auth/actions/sign_in_action.dart';
import 'package:tasky/features/auth/bloc/auth_state.dart';

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
          },
          onError: (error) {
            NotificationUtil.showError(error.message);
          },
        )
        .whereMap({'phone': phone, 'password': password})
        .execute();
  }
}
