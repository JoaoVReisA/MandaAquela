import 'package:manda_aquela/domain/entities/user.dart';
import 'package:manda_aquela/domain/repositories/AuthRepository/auth_login_repository.dart';

abstract class AuthLogin {
  Future<User> call();
}

class EmailAuthLogin extends AuthLogin {
  EmailAuthLogin(this.repository);
  final AuthLoginRepository repository;

  @override
  Future<User> call() {
    // TODO: implement call
    throw UnimplementedError();
  }
}

class GoogleAuthLogin extends AuthLogin {
  GoogleAuthLogin(this.repository);
  final AuthLoginRepository repository;

  @override
  Future<User> call() {
    // TODO: implement call
    throw UnimplementedError();
  }
}

class FacebookAuthLogin extends AuthLogin {
  FacebookAuthLogin(this.repository);
  final AuthLoginRepository repository;

  @override
  Future<User> call() {
    // TODO: implement call
    throw UnimplementedError();
  }
}
