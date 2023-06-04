import 'package:firebase_auth/firebase_auth.dart';
import 'package:manda_aquela/core/custom_exceptions.dart';
import 'package:manda_aquela/domain/repositories/AuthRepository/auth_login_repository.dart';
import 'package:manda_aquela/infrastructure/network/dio_http_service.dart';

class RemoteAuthLoginRepository extends AuthLoginRepository {
  RemoteAuthLoginRepository({required this.client});
  final HttpService client;

  @override
  Future<UserCredential?> emailLogin(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw NotFoundException('Nenhum usuário encontrado com esse e-mail');
      } else if (e.code == 'wrong-password') {
        throw UnauthorizedException(
            'Senha digitada incorreta para este usuário');
      }
      throw BadRequestException(e.code);
    }
  }
}
