import 'package:qproco_interview_project/shared/exceptions/http_exception.dart';
import 'package:dartz/dartz.dart';

abstract class AddEmployeeRepository {
  Future<Either<AppException, String>> addEmployeeData(Map<String, dynamic> data);
}