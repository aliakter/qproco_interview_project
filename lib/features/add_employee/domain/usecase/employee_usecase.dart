import 'package:dartz/dartz.dart';
import 'package:qproco_interview_project/features/employee_list/domain/repositories/employee_repositories.dart';
import 'package:qproco_interview_project/shared/domain/models/employee_list/employee_list_model.dart';
import 'package:qproco_interview_project/shared/exceptions/http_exception.dart';

class EmployeeUseCase {
  final EmployeeRepository employeeRepository;

  EmployeeUseCase(this.employeeRepository);

  Future<Either<AppException, EmployeeListModel>> employeeData(String page) async {
    return await employeeRepository.employeeData(page);
  }
}
