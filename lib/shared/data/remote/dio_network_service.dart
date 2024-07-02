import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:qproco_interview_project/config/app_configs.dart';
import '../../domain/models/response.dart' as response;
import '../../exceptions/http_exception.dart';
import '../../globals_settings.dart';
import '../../mixins/exception_handler_mixin.dart';
import 'package:qproco_interview_project/shared/data/remote/network_service.dart';

class DioNetworkService extends NetworkService with ExceptionHandlerMixin {
  final Dio dio;

  DioNetworkService(this.dio) {
    // this throws error while running test
    if (!kTestMode) {
      dio.options = dioBaseOptions;
      if (kDebugMode) {
        dio.interceptors
            .add(LogInterceptor(requestBody: true, responseBody: true));
      }
    }
  }

  BaseOptions get dioBaseOptions =>
      BaseOptions(baseUrl: baseUrl, headers: headers);

  @override
  String get baseUrl => AppConfigs.appBaseUrl;

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
    final res = await handleException(
      () => dio.post(endpoint, data: data),
      endpoint: endpoint,
    );
    return res;
  }

  @override
  Future<Either<AppException, response.Response>> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) {
    final res = handleException(
      () => dio.get(endpoint, queryParameters: queryParameters),
      endpoint: endpoint,
    );
    return res;
  }

  @override
  Future<Either<AppException, response.Response>> multipartPost(
      String endpoint, File file,
      {Map<String, dynamic>? data}) async {
    var formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(file.path, filename: "nid_of_user"),
    });

    final res = await handleException(
      () => dio.post(endpoint, data: formData),
      endpoint: endpoint,
    );
    return res;
  }

  @override
  Future<Either<AppException, response.Response>> patch(String endpoint,
      {Map<String, dynamic>? data}) async {
    final res = await handleException(
      () => dio.patch(endpoint, data: data),
      endpoint: endpoint,
    );
    return res;
  }
}
