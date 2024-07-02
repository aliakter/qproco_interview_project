import 'package:equatable/equatable.dart';

abstract class AddEmployeeEvent extends Equatable {
  const AddEmployeeEvent();

  @override
  List<Object> get props => [];
}

class PostAddEmployee extends AddEmployeeEvent {
  final String name;
  final String email;
  final String phoneNumber;
  final String role;

  const PostAddEmployee({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.role,
  });

  @override
  List<Object> get props => [name, email, phoneNumber, role];
}
