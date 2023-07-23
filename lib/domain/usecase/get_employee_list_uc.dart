import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import '../core/unions/failure.dart';
import '../core/usecase/base_uc.dart';
import '../model/employee/employee.dart';
import '../repository/my_repository.dart';

@lazySingleton
class GetEmployeeListUC extends BaseUCFutureWithoutParam<List<Employee>> {
  final MyRepository _myRepository;

  GetEmployeeListUC(this._myRepository);
  @override
  Future<Either<Failure, List<Employee>>> execute() {
    return _myRepository.getEmployeeList();
  }
}
