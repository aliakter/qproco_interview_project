import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:qproco_interview_project/features/add_employee/data/datasources/add_employee_remote_data_sources.dart';
import 'package:qproco_interview_project/features/add_employee/data/repositories/add_employee_repository_imp.dart';
import 'package:qproco_interview_project/features/add_employee/domain/repositories/add_employee_repositories.dart';
import 'package:qproco_interview_project/features/add_employee/domain/usecase/add_employee_usecase.dart';
import 'package:qproco_interview_project/features/add_employee/presentation/bloc/add_employee_list_bloc.dart';
import 'package:qproco_interview_project/features/employee_list/data/repositories/employee_repository_imp.dart';
import 'package:qproco_interview_project/features/employee_list/domain/repositories/employee_repositories.dart';
import 'package:qproco_interview_project/features/employee_list/domain/usecase/employee_usecase.dart';
import 'package:qproco_interview_project/features/employee_list/data/datasources/employee_remote_data_sources.dart';
import 'package:qproco_interview_project/features/employee_list/presentation/bloc/employee_list_bloc.dart';
import 'package:qproco_interview_project/shared/data/remote/dio_network_service.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => DioNetworkService(sl()));
  sl.registerLazySingleton(() => EmployeeBloc(sl()));
  sl.registerLazySingleton(() => EmployeeUseCase(sl()));
  sl.registerLazySingleton<EmployeeRepository>(
      () => EmployeeRepositoryImpl(sl()));
  sl.registerLazySingleton<EmployeeDataSource>(
      () => EmployeeRemoteDataSource(sl()));
  sl.registerLazySingleton(() => AddEmployeeBloc(sl()));
  sl.registerLazySingleton(() => AddEmployeeUseCase(sl()));
  sl.registerLazySingleton<AddEmployeeRepository>(
      () => AddEmployeeRepositoryImpl(sl()));
  sl.registerLazySingleton<AddEmployeeDataSource>(
      () => AddEmployeeRemoteDataSource(sl()));
}
