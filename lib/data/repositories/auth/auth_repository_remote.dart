import 'dart:async';

import 'package:mvvm_flutter/domain/validators/credentials_validator.dart';
import 'package:mvvm_flutter/utils/validation/lucid_validator_extension.dart';
import 'package:result_dart/result_dart.dart';

import '../../../domain/dtos/credentials.dart';
import '../../../domain/entities/user/user_entity.dart';
import 'auth_repository.dart';
import 'services/auth/auth_cliente_http.dart';
import 'services/auth/auth_local_storage.dart';

class AuthRepositoryRemote implements AuthRepository {
  final AuthLocalStorage _authLocalStorage;
  final AuthClienteHttp _authClienteHttp;
  final _streamController = StreamController<User>.broadcast();

  AuthRepositoryRemote(this._authLocalStorage, this._authClienteHttp);

  @override
  AsyncResult<LoggedUser> getUser() {
    return _authLocalStorage.getUser();
  }

  @override
  AsyncResult<LoggedUser> login(Credentials credentials) async {
    final validator = CredentialsValidator();
    return validator
        .validateResult(credentials)
        .flatMap(_authClienteHttp.login)
        .flatMap(_authLocalStorage.saveUser)
        .onSuccess(_streamController.add);
  }

  @override
  AsyncResult<Unit> logout() {
    return _authLocalStorage
        .removeUser()
        .onSuccess((_) => _streamController.add(const NotLoggedUser()));
  }

  @override
  Stream<User> userObserver() {
    return _streamController.stream;
  }

  @override
  void dispose() {
    _streamController.close();
  }
}
