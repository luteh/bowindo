import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_config.dart';
import 'common.dart';
import 'di/injection_container.dart';
import 'presentation/bloc/localization/localization_bloc.dart';
import 'presentation/core/style/app_theme.dart';
import 'presentation/route/routers.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: ScreenUtil.defaultSize,
      builder: (context, child) {
        return child ?? mainMaterialApp();
      },
      child: mainMaterialApp(),
    );
  }

  Widget mainMaterialApp() {
    return BlocProvider(
      create: (context) =>
          getIt.get<LocalizationBloc>()..add(const LocalizationEvent.started()),
      child: BlocSelector<LocalizationBloc, LocalizationState, Locale>(
        selector: (state) {
          return state.locale;
        },
        builder: (context, locale) {
          return MaterialApp.router(
            routerConfig: routers,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: locale,
            title: getIt.get<AppConfig>().appName,
            theme: AppTheme.getThemeData(themeType: ThemeType.light),
          );
        },
      ),
    );
  }
}
