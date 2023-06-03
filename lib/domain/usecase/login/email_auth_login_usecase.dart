import 'package:firebase_auth/firebase_auth.dart';
import 'package:manda_aquela/domain/repositories/AuthRepository/auth_login_repository.dart';

abstract class EmailAuthLoginUsecase {
  Future<UserCredential?> call(
      {required String email, required String password});
}

class RemoteEmailAuthLoginUsecase extends EmailAuthLoginUsecase {
  RemoteEmailAuthLoginUsecase({required this.repository});

  final AuthLoginRepository repository;

  @override
  Future<UserCredential?> call(
      {required String email, required String password}) async {
    return repository.emailLogin(email: email, password: password);
  }
}
