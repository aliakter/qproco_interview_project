import 'package:dartz/dartz.dart';
import 'package:qproco_interview_project/features/employee_list/data/datasources/employee_remote_data_sources.dart';
import 'package:qproco_interview_project/features/employee_list/domain/repositories/employee_repositories.dart';
import 'package:qproco_interview_project/shared/domain/models/employee_list/employee_list_model.dart';
import 'package:qproco_interview_project/shared/exceptions/http_exception.dart';

class EmployeeRepositoryImpl extends EmployeeRepository {
  final EmployeeDataSource employeeDataSource;

  EmployeeRepositoryImpl(this.employeeDataSource);

  @override
  Future<Either<AppException, EmployeeListModel>> employeeData(String page) {
    return employeeDataSource.employeeData(page);
  }
}
