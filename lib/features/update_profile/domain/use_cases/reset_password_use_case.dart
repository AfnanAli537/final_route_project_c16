import 'package:final_route_projcet_c16/features/update_profile/domain/repositories_interface/reset_password_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class ResetPasswordUseCase {
  final ResetPasswordRepo repo;

  ResetPasswordUseCase(this.repo);

  Future<String> call(String oldPassword, String newPassword) {
    return repo.resetPassword(oldPassword, newPassword);
  }
}
