
import 'package:final_route_projcet_c16/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:final_route_projcet_c16/features/auth/domain/repositories_interface/auth_repository.dart';
import 'package:final_route_projcet_c16/features/auth/domain/use_cases/register_usecase.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<String> login({
    required String email,
    required String password,
  }) async {
    final result = await remoteDataSource.login(email: email, password: password);
    return result.token; 
  }
  @override
  Future<Map<String, dynamic>> register(RegisterParams params) {
    return remoteDataSource.register(params);
  }

  @override
  Future<Map<String, dynamic>> getUserProfile() {
    return remoteDataSource.getUserProfile();
  }

  @override
  Future<String> updateProfile(Map<String, dynamic> profileData) {
    return remoteDataSource.updateProfile(profileData);
  }
}
