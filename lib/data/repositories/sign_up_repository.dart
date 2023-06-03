import 'package:firebase_auth/firebase_auth.dart';
import 'package:manda_aquela/domain/entities/user_request.dart';
import 'package:manda_aquela/domain/repositories/AuthRepository/sign_up_repository.dart';
import 'package:manda_aquela/infrastructure/network/dio_http_service.dart';

class SignUpRepositoryImpl extends SignUpRepository {
  SignUpRepositoryImpl({required this.httpService});
  final HttpService httpService;

  @override
  Future<bool> emailLogin(UserRequest userRequest) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userRequest.email,
        password: userRequest.password,
      );
      print(credential);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        return false;
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
    return false;
  }
}
