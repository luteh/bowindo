import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/core/unions/result_state.dart';
import '../../../domain/model/employee/employee.dart';
import '../../../domain/usecase/get_employee_list_uc.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetEmployeeListUC _getEmployeeListUC;
  HomeBloc(this._getEmployeeListUC) : super(HomeState.initial()) {
    on<_Started>(_onStarted);
    on<_RetryButtonClicked>(_onRetryButtonClicked);
  }
  void _onStarted(_Started event, Emitter<HomeState> emit) async {
    await _getEmployeeList(emit);
  }

  Future<void> _getEmployeeList(Emitter<HomeState> emit) async {
    emit(state.copyWith(getEmployeeListState: const ResultState.loading()));

    final result = await _getEmployeeListUC();
    result.fold(
      (l) => emit(state.copyWith(
          getEmployeeListState: ResultState.failure(failure: l))),
      (r) => emit(
          state.copyWith(getEmployeeListState: ResultState.success(data: r))),
    );
  }

  void _onRetryButtonClicked(
      _RetryButtonClicked event, Emitter<HomeState> emit) async {
    await _getEmployeeList(emit);
  }
}
