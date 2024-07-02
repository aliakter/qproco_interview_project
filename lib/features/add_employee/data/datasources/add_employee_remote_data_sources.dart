import 'package:dartz/dartz.dart';
import 'package:qproco_interview_project/shared/data/remote/dio_network_service.dart';
import 'package:qproco_interview_project/shared/exceptions/http_exception.dart';

abstract class AddEmployeeDataSource {
  Future<Either<AppException, String>> addEmployeeData(
      Map<String, dynamic> data);
}

class AddEmployeeRemoteDataSource implements AddEmployeeDataSource {
  final DioNetworkService dioNetworkService;

  AddEmployeeRemoteDataSource(this.dioNetworkService);

  @override
  Future<Either<AppException, String>> addEmployeeData(
      Map<String, dynamic> data) async {
    dioNetworkService.updateDioOptions();

    try {
      final result = await dioNetworkService.post('users', data: data);
      return result.fold(
        (exception) => Left(exception),
        (response) async {
          final responseData = response.data as Map<String, dynamic>;
          final message = responseData['createdAt'];
          return Right(message);
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
