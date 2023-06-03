import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthLoginRepository {
  Future<UserCredential?> emailLogin(
      {required String email, required String password});
}
