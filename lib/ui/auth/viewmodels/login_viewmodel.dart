import 'package:flutter/foundation.dart';
import 'package:mvvm_flutter/data/repositories/auth/auth_repository.dart';
import 'package:mvvm_flutter/domain/dtos/credentials.dart';
import 'package:mvvm_flutter/domain/entities/user/user_entity.dart';
import 'package:result_command/result_command.dart';
import 'package:result_dart/result_dart.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthRepository _authRepository;

  LoginViewModel({required AuthRepository authRepository})
      : _authRepository = authRepository;

  late final loginCommand = Command1(_login);

  AsyncResult<LoggedUser> _login(Credentials credentials) async {
    return _authRepository.login(credentials);
  }
}
