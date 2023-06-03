import 'package:manda_aquela/domain/entities/user.dart';
import 'package:manda_aquela/domain/repositories/AuthRepository/auth_login_repository.dart';

abstract class GoogleAuthLoginUsecase {
  Future<User> call();
}

class RemoteGoogleAuthLoginUsecase extends GoogleAuthLoginUsecase {
  RemoteGoogleAuthLoginUsecase(this.repository);
  final AuthLoginRepository repository;

  @override
  Future<User> call() {
    // TODO: implement call
    throw UnimplementedError();
  }
}
