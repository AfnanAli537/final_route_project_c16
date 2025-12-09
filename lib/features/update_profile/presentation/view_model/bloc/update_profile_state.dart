abstract class UpdateProfileState {}

class UpdateProfileInitial extends UpdateProfileState {}

class UpdateProfileLoading extends UpdateProfileState {}

class UpdateProfileSuccess extends UpdateProfileState {
  final String message;

  UpdateProfileSuccess(this.message);
}

class UpdateProfileDeleted extends UpdateProfileState {
  final String message;
  UpdateProfileDeleted(this.message);
}

class UpdateProfileError extends UpdateProfileState {
  final String message;

  UpdateProfileError(this.message);
}

class ResetPasswordLoading extends UpdateProfileState {}

class ResetPasswordSuccess extends UpdateProfileState {
  final String message;
  ResetPasswordSuccess(this.message);
}

class ResetPasswordError extends UpdateProfileState {
  final String message;
  ResetPasswordError(this.message);
}

