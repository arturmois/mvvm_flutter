import 'package:mvvm_flutter/domain/entities/user/user_entity.dart';
import 'package:result_dart/result_dart.dart';

import 'auth_repository.dart';

class AuthRepositoryRemote implements AuthRepository {
  @override
  AsyncResult<LoggedUser> getUser() {
    throw UnimplementedError();
  }

  @override
  AsyncResult<LoggedUser> login() {
    throw UnimplementedError();
  }

  @override
  AsyncResult<Unit> logout() {
    throw UnimplementedError();
  }

  @override
  Stream<User> userObserver() {
    throw UnimplementedError();
  }
}
