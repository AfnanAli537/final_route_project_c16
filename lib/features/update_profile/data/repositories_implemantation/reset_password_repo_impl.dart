import 'package:final_route_projcet_c16/features/update_profile/data/data_sources/reset_password_ds.dart';
import 'package:final_route_projcet_c16/features/update_profile/domain/repositories_interface/reset_password_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ResetPasswordRepo)
class ResetPasswordRepoImpl implements ResetPasswordRepo {
  final ResetPasswordDs ds;

  ResetPasswordRepoImpl(this.ds);

  @override
  Future<String> resetPassword(String oldPassword, String newPassword) {
    return ds.resetPassword(oldPassword: oldPassword, newPassword: newPassword);
  }
}
