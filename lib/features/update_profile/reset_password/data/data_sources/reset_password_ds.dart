abstract class ResetPasswordDs {
  Future<String> resetPassword({
    required String oldPassword,
    required String newPassword,
  });
}
