import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/features/auth/bloc/auth_state.dart';

class AuthBloc extends Cubit<AuthState> {
  AuthBloc() : super(const AuthState());
}
