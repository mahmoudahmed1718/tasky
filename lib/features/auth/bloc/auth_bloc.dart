import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/config/app_config.dart';
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

  Future<void> signIn({
    required String phone,
    required String password,
  }) async {}
}
