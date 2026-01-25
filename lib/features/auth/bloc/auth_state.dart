import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  const AuthState({this.isLoading = false, this.errorMessage});
  final bool isLoading;
  final String? errorMessage;
  AuthState copyWith({bool? isLoading, String? errorMessage}) => AuthState(
    isLoading: isLoading ?? this.isLoading,
    errorMessage: errorMessage ?? this.errorMessage,
  );
  @override
  List<Object?> get props => [isLoading, errorMessage];
}
