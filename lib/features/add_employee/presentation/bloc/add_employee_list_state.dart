import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';

abstract class AddEmployeeState extends Equatable {
  const AddEmployeeState();

  @override
  List<Object> get props => [];
}

class AddEmployeeLoadingState extends AddEmployeeState {
  const AddEmployeeLoadingState();
}

class AddEmployeeDoneState extends AddEmployeeState {
  final String data;

  const AddEmployeeDoneState({required this.data});

  @override
  List<Object> get props => [data];
}

class AddEmployeeErrorState extends AddEmployeeState {
  final DioException error;

  const AddEmployeeErrorState({required this.error});

  @override
  List<Object> get props => [error];
}
