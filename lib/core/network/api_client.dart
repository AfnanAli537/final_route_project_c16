import 'package:dio/dio.dart';
import 'network_config.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();
  late final Dio dio;

  factory ApiClient() {
    return _instance;
  }

  ApiClient._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: NetworkConfig.baseUrl,
        connectTimeout: NetworkConfig.timeout,
        receiveTimeout: NetworkConfig.timeout,
      ),
    );
  }

  Future<Response> get(String endpoint, {Map<String, dynamic>? params}) async {
    return await dio.get(endpoint, queryParameters: params);
  }

  Future<Response> post(String endpoint, {dynamic data}) async {
    return await dio.post(endpoint, data: data);
  }

  Future<Response> patch(String endpoint, {dynamic data}) async {
    return await dio.patch(endpoint, data: data);
  }
}
