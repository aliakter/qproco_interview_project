abstract class EmployeeEvent {
  const EmployeeEvent();
}

class GetEmployee extends EmployeeEvent {
  const GetEmployee();
}

class RefreshEmployeeList extends EmployeeEvent {
  const RefreshEmployeeList();
}