import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/extention/context_extention.dart';
import '../../../domain/core/unions/failure.dart';
import '../../../domain/model/employee/employee.dart';
import '../../bloc/home/home_bloc.dart';
import '../../core/style/sizes.dart';
import '../../core/widget/my_error_widget.dart';
import '../../core/widget/my_scaffold.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBar: AppBar(
        title: Text(context.localization.home),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) =>
            previous.getEmployeeListState != current.getEmployeeListState,
        builder: (context, state) {
          return state.getEmployeeListState.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const Center(child: CircularProgressIndicator()),
            success: (data) {
              return _employeesTable(context, data);
            },
            failure: (failure) => MyErrorWidget(
              mainAxisAlignment: MainAxisAlignment.center,
              text: failure.message,
              onTapRetry: () => context
                  .read<HomeBloc>()
                  .add(const HomeEvent.retryButtonClicked()),
            ),
          );
        },
      ),
    );
  }

  Padding _employeesTable(BuildContext context, List<Employee> data) {
    return Padding(
      padding: EdgeInsets.all(Sizes.width20),
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(1),
          1: FlexColumnWidth(3),
          2: FlexColumnWidth(3),
        },
        children: [
          TableRow(
            children: [
              _columnTitleText(
                context,
                text: context.localization.id,
              ),
              _columnTitleText(
                context,
                text: context.localization.name,
              ),
              _columnTitleText(
                context,
                text: context.localization.email,
              ),
            ],
          ),
          TableRow(
            children: [
              SizedBox(height: Sizes.height16),
              SizedBox(height: Sizes.height16),
              SizedBox(height: Sizes.height16),
            ],
          ),
          ...data.map(
            (e) => TableRow(
              children: [
                _tableItemText(text: '${e.employeeId}'),
                _tableItemText(text: e.employeeName),
                _tableItemText(text: e.employeeMail),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding _tableItemText({required String text}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sizes.width8),
      child: Text(
        text,
      ),
    );
  }

  Padding _columnTitleText(BuildContext context, {required String text}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sizes.width8),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: context.textTheme.titleMedium,
      ),
    );
  }
}
