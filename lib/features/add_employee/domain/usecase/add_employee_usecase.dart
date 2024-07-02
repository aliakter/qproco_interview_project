import 'package:dartz/dartz.dart';
import 'package:qproco_interview_project/features/add_employee/domain/repositories/add_employee_repositories.dart';
import 'package:qproco_interview_project/shared/exceptions/http_exception.dart';

class AddEmployeeUseCase {
  final AddEmployeeRepository addEmployeeRepository;

  AddEmployeeUseCase(this.addEmployeeRepository);

  Future<Either<AppException, String>> addEmployeeData(Map<String, dynamic> data) async {
    return await addEmployeeRepository.addEmployeeData(data);
  }
}
