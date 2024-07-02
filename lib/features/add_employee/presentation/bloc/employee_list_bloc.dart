import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qproco_interview_project/features/employee_list/domain/usecase/employee_usecase.dart';
import 'package:qproco_interview_project/features/employee_list/presentation/bloc/employee_list_event.dart';
import 'package:qproco_interview_project/features/employee_list/presentation/bloc/employee_list_state.dart';
import 'package:dartz/dartz.dart';
import 'package:qproco_interview_project/shared/exceptions/http_exception.dart';
import 'package:qproco_interview_project/shared/domain/models/employee_list/employee_list_model.dart';
import 'package:dio/dio.dart';

class EmployeeBloc extends Bloc<EmployeeEvent, EmployeeState> {
  final EmployeeUseCase employeeUseCase;
  bool isLoading  = false;

  EmployeeBloc(this.employeeUseCase) : super(const EmployeeLoadingState()) {
    on<GetEmployee>(onGetEmployee);
  }

  Future<void> onGetEmployee(GetEmployee event, Emitter<EmployeeState> emit) async {
    if (isLoading ) return;
    isLoading  = true;
    emit(const EmployeeLoadingState());
    try {
      final Either<AppException, EmployeeListModel> dataState = await employeeUseCase.employeeData("12");

      dataState.fold(
        (failure) {
          emit(EmployeeErrorState(error: DioException(requestOptions: RequestOptions(path: ''), error: failure.message)));
          isLoading  = false;
        },
        (employeeList) {
          emit(EmployeeDoneState(employeeListModel: employeeList));
          isLoading  = false;
        },
      );
    } catch (error) {
      emit(EmployeeErrorState(error: DioException(requestOptions: RequestOptions(path: ''), error: error)));
    } finally {
      isLoading  = false;
    }
  }
}
