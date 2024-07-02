import 'package:dartz/dartz.dart';
import 'package:qproco_interview_project/shared/data/remote/dio_network_service.dart';
import 'package:qproco_interview_project/shared/domain/models/employee_list/employee_list_model.dart';
import 'package:qproco_interview_project/shared/exceptions/http_exception.dart';

abstract class EmployeeDataSource {
  Future<Either<AppException, EmployeeListModel>> employeeData(String page);
}

class EmployeeRemoteDataSource implements EmployeeDataSource {
  final DioNetworkService dioNetworkService;

  EmployeeRemoteDataSource(this.dioNetworkService);

  @override
  Future<Either<AppException, EmployeeListModel>> employeeData(String page) async {
    try {
      final result = await dioNetworkService.get('?results=$page');
      return result.fold(
        (exception) => Left(exception),
        (response) async {
          final user = EmployeeListModel.fromJson(response.data);
          return Right(user);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Unknown error occurred',
          statusCode: 1,
          identifier: '${e.toString()}\nThe data is not in the valid format.',
        ),
      );
    }
  }
}
