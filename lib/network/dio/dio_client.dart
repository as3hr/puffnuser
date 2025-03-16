import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../utils/Constants.dart';
import '../network_response.dart';
import 'interceptors/network_interceptor.dart';

class DioClient {
  DioClient() {
    _initializeDioClient();
  }
  static const int maxRetries = 3;
  static const int retryDelay = 1;

  final dio = Dio(
    BaseOptions(
      baseUrl: DOMAIN_URL,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      responseType: ResponseType.json,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 20),
    ),
  );

  void _initializeDioClient() {
    dio.interceptors.addAll([
      NetworkInterceptor(),
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
      )
    ]);
  }

  static NetworkResponse handleDioError(DioException error) {
    String message = "";
    dynamic data;
    print("Error Type: ${error.toString()}");
    if (error.response?.data != null) {
      print("Error Response: ${error.response?.data}");
      // final responseData = error.response!.data;
      // message = responseData["message"] ?? "Unknown error occurred";
      // data = responseData["data"] ?? "";
    } else {
      switch (error.type) {
        case DioExceptionType.cancel:
          message = "Request to API server was cancelled";
          break;
        case DioExceptionType.connectionError:
          message = "Failed connection to API server";
        case DioExceptionType.connectionTimeout:
          message = "Connection timed out";
        case DioExceptionType.unknown:
          message = "A Server Error Occured!";
          break;
        case DioExceptionType.receiveTimeout:
          message = "Receive timeout in connection with API server";
          break;
        case DioExceptionType.badResponse:
          message =
              "Received invalid status code: ${error.response?.statusCode}";
          break;
        case DioExceptionType.sendTimeout:
          message = "Send timeout in connection with API server";
          break;
        case DioExceptionType.badCertificate:
          message = "Incorrect certificate";
          break;
      }
    }
    return NetworkResponse(
      message: message,
      data: data,
      failed: true,
    );
  }
}
