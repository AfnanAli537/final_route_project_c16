import 'package:final_route_projcet_c16/features/main/profile/domain/entities/profile.dart';

abstract class UpdateProfileEvent {}

class SubmitUpdateProfile extends UpdateProfileEvent {
  final Profile profile;

  SubmitUpdateProfile(this.profile);
}

class SubmitDeleteProfile extends UpdateProfileEvent {}

class SubmitResetPassword extends UpdateProfileEvent {
  final String oldPassword;
  final String newPassword;

  SubmitResetPassword(this.oldPassword, this.newPassword);
}
