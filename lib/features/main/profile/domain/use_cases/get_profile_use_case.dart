import 'package:final_route_projcet_c16/features/main/profile/domain/entities/profile.dart';
import 'package:final_route_projcet_c16/features/main/profile/domain/repositories_interface/profile_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProfile {
  final ProfileRepo repository;

  GetProfile(this.repository);

  Future<Profile> call() async {
    return await repository.getProfile();
  }
}
