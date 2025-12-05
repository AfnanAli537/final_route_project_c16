import 'package:dio/dio.dart';
import 'package:final_route_projcet_c16/core/network/network_config.dart';
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
