import 'package:dio/dio.dart';
import '../../../../core/network/endpoints.dart';
import '../../../../core/services/session_service.dart';
import 'package:final_route_projcet_c16/features/auth/domain/use_cases/register_usecase.dart';
import '../models/login_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponseModel> login({
    required String email,
    required String password,
  });

  Future<Map<String, dynamic>> register(RegisterParams params);
  Future<Map<String, dynamic>> getUserProfile();
  Future<String> updateProfile(Map<String, dynamic> profileData);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  late final Dio dio;

  AuthRemoteDataSourceImpl() {
    dio = Dio(
      BaseOptions(
        baseUrl: EndPoints.authBaseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );
  }

  @override
  Future<LoginResponseModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        'auth/login',
        data: {
          "email": email,
          "password": password,
        },
      );

      return LoginResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      final message = e.response?.data is Map ? e.response?.data["message"] ?? "Login failed" : "Login failed";
      throw Exception(message);
    } catch (e) {
      throw Exception("Unexpected error, please try again");
    }
  }

  @override
  Future<Map<String, dynamic>> register(RegisterParams params) async {
    try {
      final requestData = params.toJson();
      print('Registration data being sent: $requestData'); 

      final response = await dio.post(
        'auth/register',
        data: requestData,
      );

      if (response.data is Map<String, dynamic>) {
        print('Registration response: ${response.data}'); 
        return response.data;
      } else {
        throw Exception('Invalid response format');
      }
    } on DioException catch (e) {
      final message = e.response?.data is Map ? e.response?.data["message"] ?? "Registration failed" : "Registration failed";
      throw Exception(message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<Map<String, dynamic>> getUserProfile() async {
    try {
      final token = await SessionService.getAuthToken();

      if (token == null) {
        throw Exception('No authentication token found');
      }

      final response = await dio.get(
        EndPoints.profile,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.data is Map<String, dynamic>) {
        return response.data;
      } else {
        throw Exception('Invalid response format');
      }
    } on DioException catch (e) {
      final message = e.response?.data is Map ? e.response?.data["message"] ?? "Failed to get profile" : "Failed to get profile";
      throw Exception(message);
    } catch (e) {
      throw Exception("Unexpected error, please try again");
    }
  }

  @override
  Future<String> updateProfile(Map<String, dynamic> profileData) async {
    try {
      final token = await SessionService.getAuthToken();

      if (token == null) {
        throw Exception('No authentication token found');
      }

      final response = await dio.patch(
        EndPoints.profile,
        data: profileData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      return response.data["message"] ?? "Profile updated successfully";
    } on DioException catch (e) {
      final message = e.response?.data is Map ? e.response?.data["message"] ?? "Failed to update profile" : "Failed to update profile";
      throw Exception(message);
    } catch (e) {
      throw Exception("Unexpected error, please try again");
    }
  }
}
