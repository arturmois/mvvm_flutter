import 'package:auto_injector/auto_injector.dart';
import 'package:dio/dio.dart';
import 'package:mvvm_flutter/ui/auth/viewmodels/login_viewmodel.dart';

import '../data/repositories/auth/auth_repository.dart';
import '../data/repositories/auth/auth_repository_remote.dart';
import '../data/repositories/auth/services/auth/auth_cliente_http.dart';
import '../data/repositories/auth/services/auth/auth_local_storage.dart';
import '../data/repositories/auth/services/cliente_http.dart';
import '../data/repositories/auth/services/local_storage.dart';

final injector = AutoInjector();

setupDependencies() {
  injector.addSingleton<AuthRepository>(AuthRepositoryRemote.new);
  injector.addInstance(Dio());
  injector.addSingleton(ClientHttp.new);
  injector.addSingleton(LocalStorage.new);
  injector.addSingleton(AuthClienteHttp.new);
  injector.addSingleton(AuthLocalStorage.new);
  injector.addSingleton(LoginViewModel.new);
}
