import 'package:final_route_projcet_c16/features/profile/data/data_sources/profile_remote_ds.dart';
import 'package:final_route_projcet_c16/features/profile/data/models/profile_model.dart';
import 'package:final_route_projcet_c16/features/profile/domain/entities/profile.dart';
import 'package:final_route_projcet_c16/features/profile/domain/repositories_interface/profile_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProfileRepo)
class ProfileRepositoryImpl implements ProfileRepo {
  final ProfileRemoteDs remoteDs;

  ProfileRepositoryImpl(this.remoteDs);

  @override
  Future<Profile> getProfile() async {
    final model = await remoteDs.getProfile();
    return Profile(
      id: model.id,
      email: model.email,
      name: model.name,
      phone: model.phone,
      avaterId: model.avaterId ,
    );
  }
  @override
  Future<String> updateProfile(Profile profile) async {
    final model = profile;
    return await remoteDs.updateProfile(ProfileModel(
      id: model.id,
      email: model.email,
      name: model.name,
      phone: model.phone,
      avaterId: model.avaterId ,
    ));
  }
  @override
  Future<String> deleteProfile() async {
    return await remoteDs.deleteProfile();
  }
}