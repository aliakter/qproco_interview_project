import 'package:dartz/dartz.dart';
import 'package:qproco_interview_project/shared/domain/models/response.dart';
import 'package:qproco_interview_project/shared/exceptions/http_exception.dart';

abstract class NetworkService {
  String get baseUrl;

  String get baseUrl2;

  Map<String, Object> get headers;

  void updateHeader(Map<String, dynamic> data);

  Future<Either<AppException, Response>> get(String endpoint,
      {Map<String, dynamic>? queryParameters});

  Future<Either<AppException, Response>> post(String endpoint,
      {Map<String, dynamic>? data});
}
