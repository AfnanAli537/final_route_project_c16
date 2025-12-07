import 'package:final_route_projcet_c16/features/auth/register/domain/use_cases/register_usecase.dart';

abstract class AuthRepository {
  Future<String> login({
    required String email,
    required String password,
  });
  Future<Map<String, dynamic>> register(RegisterParams params);
  Future<Map<String, dynamic>> getUserProfile();
  Future<String> updateProfile(Map<String, dynamic> profileData);
}
