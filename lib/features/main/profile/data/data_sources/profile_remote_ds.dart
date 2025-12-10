import 'package:final_route_projcet_c16/features/main/profile/data/models/profile_model.dart';

abstract class ProfileRemoteDs {
  Future<ProfileModel> getProfile();

  Future<String> updateProfile(ProfileModel profile);

  Future<String> deleteProfile();
}
