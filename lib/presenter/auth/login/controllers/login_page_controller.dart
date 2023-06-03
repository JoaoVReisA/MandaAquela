import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:manda_aquela/domain/usecase/login/email_auth_login_usecase.dart';

class _LoginPageStateModel {
  final email = ''.obs;
  final password = ''.obs;

  bool get isFullFilled => email.value.isNotEmpty && password.value.isNotEmpty;
}

class LoginPageController extends GetxController {
  LoginPageController({required this.emailAuthLoginUsecase});

  final EmailAuthLoginUsecase emailAuthLoginUsecase;
  final _stateModel = _LoginPageStateModel();
  void setEmail(String value) {
    _stateModel.email.value = value;
  }

  void setPassword(String value) {
    _stateModel.password.value = value;
  }

  bool get isLoginButtonReady => _stateModel.isFullFilled;

  Future<UserCredential?> onTapLoginButton() async {
    final response = await emailAuthLoginUsecase.call(
        email: _stateModel.email.value, password: _stateModel.password.value);
    print(response!.user);
    return response;
  }
}
