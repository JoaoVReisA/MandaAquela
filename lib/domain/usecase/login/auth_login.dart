import 'package:manda_aquela/domain/entities/user.dart';
import 'package:manda_aquela/domain/repositories/AuthRepository/auth_login_repository.dart';

abstract class AuthLoginUsecase {
  Future<User> call();
}

class EmailAuthLoginUsecase extends AuthLoginUsecase {
  EmailAuthLoginUsecase(this.repository);
  final AuthLoginRepository repository;

  @override
  Future<User> call() {
    // TODO: implement call
    throw UnimplementedError();
  }
}

class GoogleAuthLoginUsecase extends AuthLoginUsecase {
  GoogleAuthLoginUsecase(this.repository);
  final AuthLoginRepository repository;

  @override
  Future<User> call() {
    // TODO: implement call
    throw UnimplementedError();
  }
}

class FacebookAuthLoginUsecase extends AuthLoginUsecase {
  FacebookAuthLoginUsecase(this.repository);
  final AuthLoginRepository repository;

  @override
  Future<User> call() {
    // TODO: implement call
    throw UnimplementedError();
  }
}
