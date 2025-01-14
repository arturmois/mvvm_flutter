import 'package:result_dart/result_dart.dart';

import '../../../../../domain/dtos/credentials.dart';
import '../../../../../domain/entities/user/user_entity.dart';
import '../cliente_http.dart';

class AuthClienteHttp {
  final ClienteHttp _clienteHttp;

  AuthClienteHttp(this._clienteHttp);

  AsyncResult<LoggedUser> login(Credentials credentials) async {
    final response = await _clienteHttp.post(
      '/login',
      {'email': credentials.email, 'password': credentials.password},
    );
    return response.map((response) {
      return LoggedUser.fromJson(response.data);
    });
  }
}
