import 'package:freezed_annotation/freezed_annotation.dart';

part 'employee.freezed.dart';

@freezed
class Employee with _$Employee {
  const factory Employee({
    required int employeeId,
    required String employeeName,
    required String employeeAddress,
    required String employeeDob,
    required String employeeMail,
    required int departmentId,
    required int flagEmployee,
    required String branchId,
    required String branchName,
    required String departmentName,
  }) = _Employee;
}
