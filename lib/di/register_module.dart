import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/constant/dependency_name.dart';
import 'injection_container.dart';

@module
abstract class RegisterModule {
  @Named(DependencyName.baseUrl)
  @lazySingleton
  @prod
  String get baseUrlProd => 'bowindo.servehttp.com';

  @Named(DependencyName.baseUrl)
  @lazySingleton
  @dev
  String get baseUrlDev => 'bowindo.servehttp.com';

  @Named(DependencyName.baseUrl)
  @lazySingleton
  @stg
  String get baseUrlStg => 'bowindo.servehttp.com';

  @lazySingleton
  @dev
  Environment get envDev => dev;

  @lazySingleton
  @stg
  Environment get envStg => stg;

  @lazySingleton
  @prod
  Environment get envProd => prod;

  @preResolve
  @lazySingleton
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  http.Client get httpClient => http.Client();
}
