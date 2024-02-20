import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();

  Future<Response> getData(
      {required String url,
      Map<String, dynamic>? query,
      String? token,
      Map<String, String>? headers,
      String? contentType}) async {
    var response = await dio.get(url,
        options: Options(
          contentType: contentType,
          headers: headers ?? {'Authorization': "Bearer $token"},
        ));
    return response;
  }

  Future<Response> post(
      {required Map<String, dynamic> data,
      required String url,
      required String token,
      Map<String, String>? headers,
      String? contentType}) async {
    var response = await dio.post(url,
        data: data,
        options: Options(
          contentType: contentType,
          headers: headers ?? {'Authorization': "Bearer $token"},
        ));
    return response;
  }

  Future<Response> put({
    required String url,
    required String token,
    Map<String, String>? headers,
    String? contentType,
    Map<String, dynamic>? queryParameters,
    required Map<String, dynamic> data,
  }) async {
    var response = await dio.put(url,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          contentType: contentType,
          headers: headers ?? {'Authorization': "Bearer $token"},
        ));
    return response;
  }

  Future<Response> delete({
    required String url,
    required String token,
    Map<String, String>? headers,
    String? contentType,
    Map<String, dynamic>? queryParameters,
  }) async {
    var response = await dio.delete(url,
        queryParameters: queryParameters,
        options: Options(
          contentType: contentType,
          headers: headers ?? {'Authorization': "Bearer $token"},
        ));
    return response;
  }
}
