import 'package:result_dart/result_dart.dart';

import '../../../../../domain/dtos/credentials.dart';
import '../../../../../domain/entities/user/user_entity.dart';
import '../../../exceptions/exceptions.dart';
import '../cliente_http.dart';

class AuthClienteHttp {
  final ClientHttp _clienteHttp;

  AuthClienteHttp(this._clienteHttp);

  AsyncResult<LoggedUser> login(Credentials credentials) async {
    // final response = await _clienteHttp.post(
    //   '/login',
    //   {'email': credentials.email, 'password': credentials.password},
    // );
    // return response.map((response) {
    //   return LoggedUser.fromJson(response.data);
    // });

    await Future.delayed(const Duration(seconds: 2));
    // return Success(LoggedUser(
    //   id: 1,
    //   name: 'name',
    //   email: 'email',
    //   token: 'token',
    //   refreshToken: 'refreshToken',
    // ));
    return Failure(LocalStorageException('Error on login'));
  }
}
