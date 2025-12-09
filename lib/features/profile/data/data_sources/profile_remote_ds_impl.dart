import 'package:dio/dio.dart';
import 'package:final_route_projcet_c16/core/error/api_error_handler.dart';
import 'package:final_route_projcet_c16/core/network/endpoints.dart';
import 'package:final_route_projcet_c16/features/profile/data/data_sources/profile_remote_ds.dart';
import 'package:final_route_projcet_c16/features/profile/data/models/profile_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/services/session_service.dart';

@LazySingleton(as: ProfileRemoteDs)
class ProfileRemoteDsImpl implements ProfileRemoteDs {
  final Dio dio;

  ProfileRemoteDsImpl(this.dio);

  @override
  Future<ProfileModel> getProfile() async {
    try {
      final token = await SessionService.getAuthToken() ?? '';

      final response = await dio.get(
        '${Endpoints.authBaseUrl}${Endpoints.profile}',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      return ProfileModel.fromJson(response.data);
    } on DioException catch (e) {
      final message = e.response?.data is Map ? e.response?.data["message"] ?? "Failed to get profile" : "Failed to get profile";
      throw Exception(message);
    } catch (e) {
      throw Exception("Unexpected error, please try again");
    }
  }

  @override
  Future<String> updateProfile(ProfileModel profile) async {
    try {
      final token = await SessionService.getAuthToken() ?? '';
      final response = await dio.patch(
        '${Endpoints.authBaseUrl}${Endpoints.profile}',
        data: profile.toJson(),
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      return response.data['message'];
    } on DioException catch (e) {
      final message = e.response?.data is Map ? e.response?.data["message"] ?? "Failed to get profile" : "Failed to get profile";
      throw Exception(message);
    } catch (e) {
      throw Exception("Unexpected error, please try again");
    }
  }
  @override
  Future<String> deleteProfile() async {
    try{
      final token = await SessionService.getAuthToken() ?? '';
      final response = await dio.delete(
        '${Endpoints.authBaseUrl}${Endpoints.profile}',
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      return response.data['message'];
    } on DioException catch (e) {
      print("Reset Password Error: ${e.response?.data}");
      final msg = e.response?.data?["message"] ?? "Reset Password failed";
      throw Exception(msg);
    }

  }
}

