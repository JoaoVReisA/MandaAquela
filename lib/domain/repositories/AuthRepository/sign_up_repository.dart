import 'package:firebase_auth/firebase_auth.dart';
import 'package:manda_aquela/domain/entities/user_request.dart';

abstract class SignUpRepository {
  Future<UserCredential?> emailSignUp(UserRequest userRequest);

  Future<void> sendResetPasswordEmailCode({required String email});

  Future<String> verifyEmailCode({required String code});

  Future<void> sendResetNewPassword(
      {required String code, required String newPassword});
}
