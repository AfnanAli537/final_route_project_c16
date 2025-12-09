import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/network/endpoints.dart';
import '../../../../core/services/session_service.dart';
import 'reset_password_ds.dart';

class ResetPasswordDsImpl implements ResetPasswordDs {
  final Dio dio;

  ResetPasswordDsImpl(@Named('authorizedDio') this.dio);

  @override
  Future<String> resetPassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    final token = await SessionService.getAuthToken();

    try {
      final response = await dio.patch(
        "${Endpoints.authBaseUrl}${Endpoints.resetPassword}",
        data: {
          "oldPassword": oldPassword,
          "newPassword": newPassword,
        },
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data["message"] ?? "Password reset successfully";
      } else {
        throw Exception(response.data["message"] ?? "Reset Password failed");
      }
    } on DioException catch (e) {
      final msg = e.response?.data?["message"] ?? "Reset Password failed";
      throw Exception(msg);
    } catch (e) {
      throw Exception("Unexpected error, please try again");
    }
  }
}
