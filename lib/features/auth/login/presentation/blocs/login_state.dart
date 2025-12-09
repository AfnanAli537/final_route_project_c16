import 'package:equatable/equatable.dart';

class LoginState extends Equatable {
  final bool isLoading;
  final String? token;
  final String? errorMessage;
  final bool loginSuccess;

  const LoginState({
    this.isLoading = false,
    this.token,
    this.errorMessage,
    this.loginSuccess = false,
  });

  LoginState copyWith({
    bool? isLoading,
    String? token,
    String? errorMessage,
    bool? loginSuccess,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      token: token ?? this.token,
      errorMessage: errorMessage,
      loginSuccess: loginSuccess ?? this.loginSuccess,
    );
  }

  @override
  List<Object?> get props => [isLoading, token, errorMessage, loginSuccess];
}
