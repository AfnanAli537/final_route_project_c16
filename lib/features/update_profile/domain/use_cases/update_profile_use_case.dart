import 'package:final_route_projcet_c16/features/profile/domain/entities/profile.dart';
import 'package:final_route_projcet_c16/features/profile/domain/repositories_interface/profile_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateProfileUseCase {
  final ProfileRepo repository;

  UpdateProfileUseCase(this.repository);

  Future<String> call(Profile profile) async {
    return await repository.updateProfile(profile);
  }
}
