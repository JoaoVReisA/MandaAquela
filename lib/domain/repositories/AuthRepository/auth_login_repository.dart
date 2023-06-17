import 'package:firebase_auth/firebase_auth.dart';
import 'package:manda_aquela/data/models/user_model.dart';

abstract class AuthLoginRepository {
  Future<UserCredential?> emailLogin(
      {required String email, required String password});

  Future<UserModel> tokenLogin({required String token});
}
