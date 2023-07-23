import 'dart:convert';

import 'package:injectable/injectable.dart';

import '../../core/serialize_helper.dart';
import '../api_service/my_api_service.dart';
import '../model/request/login/login_request.dart';
import '../model/response/base_response.dart';
import '../model/response/employee/employee_response.dart';
import '../model/response/login/login_response.dart';
import 'remote_data_source.dart';

@LazySingleton(as: RemoteDataSource)
class RemoteDataSourceImpl with SerializeHelper implements RemoteDataSource {
  final MyApiService _myApiService;

  RemoteDataSourceImpl(this._myApiService);
  @override
  Future<BaseResponse<LoginResponse>> login(LoginRequest request) async {
    final response = await _myApiService.login(request);

    return BaseResponse.fromJson(
      jsonDecode(response.body),
      (json) => LoginResponse.fromJson(json as dynamic),
    );
  }

  @override
  Future<BaseResponse<List<EmployeeResponse>>> getEmployeeList() async {
    final response = await _myApiService.getEmployeeList();

    return BaseResponse.fromJson(
      jsonDecode(response.body),
      (json) => serializeList<EmployeeResponse>(
          json, (p0) => EmployeeResponse.fromJson(p0)),
    );
  }
}
