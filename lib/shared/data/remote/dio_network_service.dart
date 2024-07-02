import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:qproco_interview_project/config/app_configs.dart';
import 'package:qproco_interview_project/shared/exceptions/http_exception.dart';
import 'package:qproco_interview_project/shared/globals_settings.dart';
import 'package:qproco_interview_project/shared/domain/models/response.dart' as response;
import 'package:qproco_interview_project/shared/mixins/exception_handler_mixin.dart';
import 'package:qproco_interview_project/shared/data/remote/network_service.dart';

class DioNetworkService extends NetworkService with ExceptionHandlerMixin {
  final Dio dio;

  DioNetworkService(this.dio) {
    if (!kTestMode) {
      updateDioOptions();
      if (kDebugMode) {
        dio.interceptors
            .add(LogInterceptor(requestBody: true, responseBody: true));
      }
    }
  }

  void updateDioOptions() {
    dio.options = BaseOptions(
      baseUrl: IS_POST == "true" ? baseUrl2 : baseUrl,
      headers: headers,
    );
  }

  @override
  String get baseUrl => AppConfigs.appBaseUrl;

  @override
  String get baseUrl2 => AppConfigs.appBaseUrl2;

  @override
  Map<String, Object> get headers => {
    'accept': 'application/json',
    'content-type': 'application/json',
  };

  @override
  Map<String, dynamic>? updateHeader(Map<String, dynamic> data) {
    final header = {...data, ...headers};
    if (!kTestMode) {
      dio.options.headers = header;
    }
    return header;
  }

  @override
  Future<Either<AppException, response.Response>> post(String endpoint,
      {Map<String, dynamic>? data}) async {
    final res = await handleException(() => dio.post(endpoint, data: data),
        endpoint: endpoint);
    return res;
  }

  @override
  Future<Either<AppException, response.Response>> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) {
    final res = handleException(
            () => dio.get(endpoint, queryParameters: queryParameters),
        endpoint: endpoint);
    return res;
  }
}
