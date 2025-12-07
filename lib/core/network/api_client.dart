import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
@lazySingleton
class ApiClient {
  final Dio _dio;

  ApiClient(this._dio);

  Future<Response> get(String endpoint, {Map<String, dynamic>? params,  Options? options}) async {
    return await _dio.get(endpoint, queryParameters: params);
  }

  Future<Response> post(String endpoint, {dynamic data}) async {
    return await _dio.post(endpoint, data: data);
  }

  Future<Response> patch(String endpoint, {dynamic data}) async {
    return await _dio.patch(endpoint, data: data);
  }
}
