import 'package:dartz/dartz.dart';
import 'package:qproco_interview_project/features/add_employee/data/datasources/add_employee_remote_data_sources.dart';
import 'package:qproco_interview_project/features/add_employee/domain/repositories/add_employee_repositories.dart';
import 'package:qproco_interview_project/shared/exceptions/http_exception.dart';

class AddEmployeeRepositoryImpl extends AddEmployeeRepository {
  final AddEmployeeDataSource addEmployeeDataSource;

  AddEmployeeRepositoryImpl(this.addEmployeeDataSource);

  @override
  Future<Either<AppException, String>> addEmployeeData(Map<String, dynamic> data) {
    return addEmployeeDataSource.addEmployeeData(data);
  }
}
