import 'package:result_dart/result_dart.dart';

import '../../../domain/dtos/credentials.dart';
import '../../../domain/entities/user/user_entity.dart';

abstract class AuthRepository {
  AsyncResult<LoggedUser> login(Credentials credentials);
  AsyncResult<Unit> logout();
  AsyncResult<LoggedUser> getUser();
  Stream<User> userObserver();
  void dispose();
}
