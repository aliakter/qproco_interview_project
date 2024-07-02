import 'package:qproco_interview_project/shared/domain/models/employee_list/employee_list_model.dart';
import 'package:qproco_interview_project/shared/exceptions/http_exception.dart';
import 'package:dartz/dartz.dart';

abstract class EmployeeRepository {
  Future<Either<AppException, EmployeeListModel>> employeeData(String page);
}