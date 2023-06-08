import 'package:manda_aquela/domain/entities/user_entity.dart';
import 'package:manda_aquela/domain/repositories/AuthRepository/auth_login_repository.dart';

abstract class GoogleAuthLoginUsecase {
  Future<UserEntity> call();
}

class RemoteGoogleAuthLoginUsecase extends GoogleAuthLoginUsecase {
  RemoteGoogleAuthLoginUsecase(this.repository);
  final AuthLoginRepository repository;

  @override
  Future<UserEntity> call() {
    // TODO: implement call
    throw UnimplementedError();
  }
}
