import 'package:firebase_auth/firebase_auth.dart';
import 'package:manda_aquela/domain/entities/user_request.dart';

abstract class SignUpRepository {
  Future<UserCredential?> emailSignUp(UserRequest userRequest);

  Future<bool> sendResetPasswordEmailCode({required String email});
}
