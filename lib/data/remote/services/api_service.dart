import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../settings/result.dart';
import '../config.dart';
import 'app_interceptors.dart';

@lazySingleton
class ApiService {
  final dio = _createDio();

  static Dio _createDio() {
    const duration = Duration(seconds: 15);
    var dio = Dio(BaseOptions(
      baseUrl: Config.basicUrl,
      receiveTimeout: duration, // 15 seconds
      connectTimeout: duration,
      sendTimeout: duration,
      headers: {'accept': 'application/json'},
      validateStatus: (status) {
        return status! != 401 && status < 500;
      },
    ));

    dio.interceptors.addAll({
      AppInterceptors(dio),
    });
    return dio;
  }

  Future<Response> post({required String uri, Map<String, dynamic>? body}) async {
    return dio.post(
      generateLink(uri),
      data: body,
    );
  }

  Future<Response> delete(String uri) async {
    return dio.delete(generateLink(uri));
  }

  Future<Result<Response, Exception>> get(
    String uri, {
    Map<String, dynamic>? params,
    Map<String, dynamic>? customHeaders,
    Options? customOptions,
    Object? data,
    bool? withoutToken,
    String? path,
  }) async {
    if (customHeaders != null) {
      dio.options.headers.addAll(customHeaders);
    }

    if (params != null) dio.options.queryParameters = params;
    final jsonData = jsonEncode(data);
    try {
      return Success(await dio.get(path ?? generateLink(uri), options: customOptions, data: jsonData));
    } on DioException catch (e) {
      return Failure(e);
    }
  }

  Future<Result<Response, Exception>> patch(
    String uri,
    Map<String, dynamic> body,
    Map<String, dynamic>? customHeaders,
  ) async {
    if (customHeaders != null) {
      dio.options.headers.addAll(customHeaders);
    }
    try {
      return Success(
        await dio.patch(
          generateLink(uri),
          data: body,
        ),
      );
    } on DioException catch (e) {
      return Failure(e);
    }
  }

  Future<Response> put({required String uri, required Map<String, dynamic> body, Map<String, dynamic>? params}) async {
    if (params != null) dio.options.queryParameters = params;

    return dio.put(
      generateLink(uri),
      data: body,
    );
  }

  String generateLink(String uri) => Uri.https(Config.basicUrl, uri).toString();
}
