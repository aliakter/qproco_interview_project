import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:qproco_interview_project/features/add_employee/domain/usecase/add_employee_usecase.dart';
import 'package:qproco_interview_project/features/add_employee/presentation/bloc/add_employee_list_event.dart';
import 'package:qproco_interview_project/features/add_employee/presentation/bloc/add_employee_list_state.dart';
import 'package:qproco_interview_project/shared/exceptions/http_exception.dart';

class AddEmployeeBloc extends Bloc<AddEmployeeEvent, AddEmployeeState> {
  final AddEmployeeUseCase addEmployeeUseCase;
  bool isLoading  = false;

  AddEmployeeBloc(this.addEmployeeUseCase) : super(const AddEmployeeLoadingState()) {
    on<PostAddEmployee>(onPostAddEmployee);
  }

  Future<void> onPostAddEmployee(PostAddEmployee event, Emitter<AddEmployeeState> emit) async {
    if (isLoading ) return;
    isLoading  = true;
    emit(const AddEmployeeLoadingState());

    Map<String, dynamic> data = {
      'name': event.name.trim(),
      'email': event.email.trim(),
      'number': event.phoneNumber.trim(),
      'role': event.role,
    };

    try {
      final Either<AppException, String> dataState = await addEmployeeUseCase.addEmployeeData(data);

      dataState.fold(
            (failure) {
            emit(AddEmployeeErrorState(error: DioException(requestOptions: RequestOptions(path: ''), error: failure.message)));
            isLoading  = false;
          },
            (data) {
            emit(AddEmployeeDoneState(data: data));
            isLoading  = false;
        },
      );
    } catch (error) {
      emit(AddEmployeeErrorState(error: DioException(requestOptions: RequestOptions(path: ''), error: error)));
    } finally {
      isLoading  = false;
    }
  }
}
