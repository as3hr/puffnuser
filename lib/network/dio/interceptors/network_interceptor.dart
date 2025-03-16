import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../main.dart';
import '../../../utils/Constants.dart';

class NetworkInterceptor extends Interceptor {
  String _tokenValue = "";

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    dynamic data = response.data;

    if (data is String) {
      data = jsonDecode(data);
    }

    if (data is Map<String, dynamic> &&
        data['data'] is Map<String, dynamic> &&
        data['data']['api_token'] != null) {
      _tokenValue = data['data']['api_token'].toString();
      print("Token found: $_tokenValue");
      appStorage.write(tokenKey, _tokenValue);
    }

    final newResp = Response(
      requestOptions: response.requestOptions,
      data: data,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      headers: response.headers,
      isRedirect: response.isRedirect,
      redirects: response.redirects,
      extra: response.extra,
    );

    return handler.next(newResp);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = appStorage.read(tokenKey);
    if (token != null) {
      print("Adding token to request: $token");
      options.headers['Authorization'] = 'Bearer $token';
    }
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print("Interceptor Error: ${err.message}");
    return handler.next(err);
  }
}
