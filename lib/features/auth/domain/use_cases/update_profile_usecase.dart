import '../repositories_interface/auth_repository.dart';

class UpdateProfileUseCase {
  final AuthRepository repository;

  UpdateProfileUseCase(this.repository);

  Future<String> execute(Map<String, dynamic> profileData) {
    return repository.updateProfile(profileData);
  }
}
