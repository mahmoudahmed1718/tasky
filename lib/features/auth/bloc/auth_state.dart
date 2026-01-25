import 'package:equatable/equatable.dart';
import 'package:tasky/app/models/user_model.dart';

class AuthState extends Equatable {
  const AuthState({this.isLoading = false, this.errorMessage, this.user});
  final bool isLoading;
  final String? errorMessage;
  final UserModel? user;

  AuthState copyWith({
    bool? isLoading,
    String? errorMessage,
    UserModel? user,
  }) => AuthState(
    isLoading: isLoading ?? this.isLoading,
    errorMessage: errorMessage ?? this.errorMessage,
    user: user ?? this.user,
  );

  @override
  List<Object?> get props => [isLoading, errorMessage, user];
}
