import 'package:final_route_projcet_c16/features/auth/domain/repositories_interface/auth_repository.dart';



class GetUserProfileUseCase {
  final AuthRepository repository;

  GetUserProfileUseCase(this.repository);

  Future<Map<String, dynamic>> execute() {
    return repository.getUserProfile();
  }
}
