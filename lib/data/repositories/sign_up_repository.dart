import 'package:firebase_auth/firebase_auth.dart';
import 'package:manda_aquela/core/custom_exceptions.dart';
import 'package:manda_aquela/core/endpoints.dart';
import 'package:manda_aquela/data/models/musician_request.dart';
import 'package:manda_aquela/domain/entities/user_request.dart';
import 'package:manda_aquela/domain/repositories/AuthRepository/sign_up_repository.dart';
import 'package:manda_aquela/infrastructure/network/dio_http_service.dart';

class SignUpRepositoryImpl extends SignUpRepository {
  SignUpRepositoryImpl({required this.httpService});
  final HttpService httpService;

  @override
  Future<UserCredential?> emailSignUp(UserRequest userRequest) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userRequest.email,
        password: userRequest.password,
      );

      await credential.user?.updateDisplayName(userRequest.name);

      print(credential);
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw BadRequestException('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw BadRequestException('The account already exists for that email.');
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  @override
  Future<bool> sendResetPasswordEmailCode({required String email}) async {
    try {
      await FirebaseAuth.instance.setLanguageCode("pt-br");
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'auth/user-not-found') {
        throw BadRequestException('Usuário não encontrado');
      }
      throw BadRequestException(e.code);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signUpMusician(MusicianRequest userRequest) async {
    try {
      final response = await httpService.post(
        '${Endpoints.base}/signup',
        userRequest.toJson(),
        {},
      );
      print(response.body);
      print(response.statusCode);
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
