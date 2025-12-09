import 'package:final_route_projcet_c16/features/profile/domain/repositories_interface/profile_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteProfile {
  final ProfileRepo repository;

  DeleteProfile(this.repository);

  Future<String> call() async {
    return await repository.deleteProfile();
  }
}
