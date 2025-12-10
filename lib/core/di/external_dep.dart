import 'package:dio/dio.dart';
import 'package:final_route_projcet_c16/core/network/network_config.dart';
import 'package:final_route_projcet_c16/features/update_profile/reset_password/data/data_sources/reset_password_ds.dart';
import 'package:final_route_projcet_c16/features/update_profile/reset_password/data/data_sources/reset_password_ds_impl.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio => Dio(  BaseOptions(
      baseUrl: NetworkConfig.baseUrl,
      connectTimeout: NetworkConfig.timeout,
      receiveTimeout: NetworkConfig.timeout,
    ),);
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}


@module
abstract class ResetPasswordModule {
  @lazySingleton
  @Named('authorizedDio')
  Dio get authorizedDio => Dio(
    BaseOptions(
      baseUrl: 'https://route-movie-apis.vercel.app',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );

  @lazySingleton
  ResetPasswordDs provideResetPasswordDs(@Named('authorizedDio') Dio dio) =>
      ResetPasswordDsImpl(dio);
}

@lazySingleton
Dio get dioInstance => Dio();