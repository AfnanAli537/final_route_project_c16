import 'package:equatable/equatable.dart';

class RegisterState extends Equatable {
  final bool isLoading;
  final String? successMessage;
  final String? errorMessage;

  const RegisterState({
    this.isLoading = false,
    this.successMessage,
    this.errorMessage,
  });

  RegisterState copyWith({
    bool? isLoading,
    String? successMessage,
    String? errorMessage,
  }) {
    return RegisterState(
      isLoading: isLoading ?? this.isLoading,
      successMessage: successMessage,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [isLoading, successMessage, errorMessage];
}
