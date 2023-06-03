import 'package:firebase_auth/firebase_auth.dart';
import 'package:manda_aquela/domain/repositories/AuthRepository/auth_login_repository.dart';

abstract class FacebookAuthLoginUsecase {}

class RemoteFacebookAuthLoginUsecase extends FacebookAuthLoginUsecase {
  RemoteFacebookAuthLoginUsecase(this.repository);
  final AuthLoginRepository repository;

  @override
  Future<User> call() {
    // TODO: implement call
    throw UnimplementedError();
  }
}
