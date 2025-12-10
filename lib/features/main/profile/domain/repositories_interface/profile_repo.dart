import 'package:final_route_projcet_c16/features/main/profile/domain/entities/profile.dart';

abstract class ProfileRepo {
  Future<Profile> getProfile();

  Future<String> updateProfile(Profile profile);

  Future<String> deleteProfile();
}
