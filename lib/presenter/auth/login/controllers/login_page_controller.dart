import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:manda_aquela/core/custom_exceptions.dart';
import 'package:manda_aquela/core/extensions/string_extensions.dart';
import 'package:manda_aquela/domain/entities/user_firebase_info.dart';
import 'package:manda_aquela/domain/usecase/login/email_auth_login_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _LoginPageStateModel {
  final email = ''.obs;
  final password = ''.obs;

  bool get isFullFilled => email.value.isNotEmpty && password.value.isNotEmpty;
}

class LoginPageController extends GetxController {
  LoginPageController({required this.emailAuthLoginUsecase});

  final EmailAuthLoginUsecase emailAuthLoginUsecase;
  final _stateModel = _LoginPageStateModel();

  late void Function(String message) onLoginErrorFunction;

  void setEmail(String value) {
    _stateModel.email.value = value;
  }

  void setPassword(String value) {
    _stateModel.password.value = value;
  }

  bool get isLoginButtonReady =>
      _stateModel.isFullFilled && _stateModel.email.value.isValidEmail;

  Future<UserCredential?> doUserLogin() async {
    try {
      final response = await emailAuthLoginUsecase.call(
          email: _stateModel.email.value, password: _stateModel.password.value);

      UserFirebaseInfo.instance.email = response?.user!.email;
      UserFirebaseInfo.instance.name = response?.user!.displayName;
      UserFirebaseInfo.instance.uid = response?.user!.uid;

      final prefs = await SharedPreferences.getInstance();
      prefs.setString('uid', response?.user!.uid ?? '');

      print(response?.user);

      return response;
    } on CustomException catch (e) {
      onLoginErrorFunction(e.message);
    }
    return null;
  }
}
