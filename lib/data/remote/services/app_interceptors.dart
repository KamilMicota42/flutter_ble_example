import 'package:dio/dio.dart';

import '../../../services/secure_storage_service.dart';
import '../../../settings/injection.dart';
import '../../../utils/global/logger.dart';

class AppInterceptors extends QueuedInterceptor {
  final Dio dio;
  final secureStorage = getIt<SecureStorageService>();

  AppInterceptors(this.dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    Logging.log("http onRequest");

    if (options.extra['skipAuth'] == true) {
      return handler.next(options);
    }

    var accessToken = await secureStorage.getToken();
    options.headers['X-Auth-Token'] = accessToken;

    return handler.next(options);
  }

  @override
  void onError(DioException err, handler) async {
    if (err.response?.statusCode == 401) {
      Logging.log("http onError");
      var token = await secureStorage.getToken();

      if (token == err.requestOptions.headers['X-Auth-Token']) {
        // HERE WE REFRESH THE TOKEN
        // await LoggedUserService.refreshToken();
        token = await secureStorage.getToken();
      }

      err.requestOptions.headers['X-Auth-Token'] = token;

      return handler.resolve(await dio.fetch(err.requestOptions));
    }
    return handler.next(err);
  }
}
