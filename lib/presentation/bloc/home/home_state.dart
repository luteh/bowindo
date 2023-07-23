part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required ResultState<List<Employee>> getEmployeeListState,
  }) = _HomeState;
  factory HomeState.initial() => const HomeState(
        getEmployeeListState: ResultState.initial(),
      );
}
