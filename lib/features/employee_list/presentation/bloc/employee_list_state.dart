import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:qproco_interview_project/shared/domain/models/employee_list/employee_list_model.dart';

@immutable
abstract class EmployeeState extends Equatable {
  final EmployeeListModel? employeeListModel;
  final DioException? error;

  const EmployeeState({this.employeeListModel, this.error});

  @override
  List<Object?> get props => [employeeListModel, error];
}

class EmployeeLoadingState extends EmployeeState {
  const EmployeeLoadingState();
}

class EmployeeDoneState extends EmployeeState {
  const EmployeeDoneState({required EmployeeListModel employeeListModel})
      : super(employeeListModel: employeeListModel);

  @override
  List<Object?> get props => [employeeListModel];
}

class EmployeeErrorState extends EmployeeState {
  const EmployeeErrorState({required DioException error}) : super(error: error);

  @override
  List<Object?> get props => [error];
}
