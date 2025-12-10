abstract class ResetPasswordRepo {
  Future<String> resetPassword(String oldPassword, String newPassword);
}
