import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../keys/secure_shared_pref.dart';
import '../utilities/service_locator.dart';

class DioHelper {
  late final Dio _dio;
  static final baseURL = sl<DotEnv>().get("baseUrl");

  DioHelper() {
    _dio = Dio(
      BaseOptions(
        followRedirects: false,
        validateStatus: (status) => true,
        baseUrl: baseURL,
        receiveDataWhenStatusError: true,
        sendTimeout: const Duration(hours: 2),
      ),
    );
  }

  Future<Response?> getData({
    required String url,
    Map<String, dynamic> query = const {},
    String? bearerToken,
  }) async {
    _dio.options.headers = {
      if (bearerToken != null) 'Authorization': 'Bearer $bearerToken',
    };
    query.addAll({"lang": "ar"});

    return await _dio.get(
      url,
      queryParameters: query,
    );
  }

  Future<Response?> download({
    required String url,
    required String path,
    Map<String, dynamic>? query,
  }) async {
    return await _dio.download(
      url,
      path,
      queryParameters: query,
    );
  }

  Future<Response?> postData({
    required String url,
    Map<String, dynamic>? query,
    FormData? data,
    void Function(int, int)? onSendProgress,
  }) async {
    data ??= FormData();
    final token = await sl<FlutterSecureStorage>().read(key: SecSPVars.token);
    final id = await sl<FlutterSecureStorage>().read(key: SecSPVars.id);
    _dio.options.headers = {
      'bt': token,
      'ui': id,
    };
    data.fields.add(const MapEntry("lang", "ar"));
    return await _dio.post(
      "/$url",
      queryParameters: query,
      data: data,
      onSendProgress: onSendProgress,
    );
  }

  Future<Response?> patchData({
    required String url,
    Map<String, dynamic>? query,
    dynamic data,
  }) async {
    return await _dio.patch(
      url,
      queryParameters: query,
      data: data,
    );
  }

  Future<Response?> deleteData({
    required String url,
    Map<String, dynamic>? query,
    dynamic data,
  }) async {
    return await _dio.delete(
      url,
      queryParameters: query,
      data: data,
    );
  }

  Future<Response?> putData({
    required String url,
    Map<String, dynamic>? query,
    dynamic data,
  }) async {
    return await _dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
