import 'package:equatable/equatable.dart';

class RegisterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class RegisterSubmitted extends RegisterEvent {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;
  final String phone;
  final int avatarId;

  RegisterSubmitted({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.phone,
    required this.avatarId,
  });

  @override
  List<Object?> get props =>
      [name, email, password, confirmPassword, phone, avatarId];
}
