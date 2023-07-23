import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/extention/number_extention.dart';
import '../../../../../core/extention/string_extention.dart';
import '../../../../../domain/model/employee/employee.dart';

part 'employee_response.freezed.dart';
part 'employee_response.g.dart';

@freezed
class EmployeeResponse with _$EmployeeResponse {
  const EmployeeResponse._();
  const factory EmployeeResponse({
    @JsonKey(name: 'employee_id') int? employeeId,
    @JsonKey(name: 'employee_name') String? employeeName,
    @JsonKey(name: 'employee_address') String? employeeAddress,
    @JsonKey(name: 'employee_dob') String? employeeDob,
    @JsonKey(name: 'employee_mail') String? employeeMail,
    @JsonKey(name: 'department_id') int? departmentId,
    @JsonKey(name: 'flag_employee') int? flagEmployee,
    @JsonKey(name: 'branch_id') String? branchId,
    @JsonKey(name: 'branch_name') String? branchName,
    @JsonKey(name: 'department_name') String? departmentName,
  }) = _EmployeeResponse;

  factory EmployeeResponse.fromJson(Map<String, dynamic> json) =>
      _$EmployeeResponseFromJson(json);

  Employee toDomain() => Employee(
        employeeId: employeeId.orEmpty,
        employeeName: employeeName.orEmpty,
        employeeAddress: employeeAddress.orEmpty,
        employeeDob: employeeDob.orEmpty,
        employeeMail: employeeMail.orEmpty,
        departmentId: departmentId.orEmpty,
        flagEmployee: flagEmployee.orEmpty,
        branchId: branchId.orEmpty,
        branchName: branchName.orEmpty,
        departmentName: departmentName.orEmpty,
      );
}
