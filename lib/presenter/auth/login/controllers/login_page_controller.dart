import 'package:get/get.dart';
import 'package:manda_aquela/core/custom_exceptions.dart';
import 'package:manda_aquela/core/extensions/string_extensions.dart';
import 'package:manda_aquela/data/models/user_model.dart';
import 'package:manda_aquela/domain/entities/user_firebase_info.dart';
import 'package:manda_aquela/domain/usecase/login/email_auth_login_usecase.dart';
import 'package:manda_aquela/domain/usecase/login/token_auth_login_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _LoginPageStateModel {
  final email = ''.obs;
  final password = ''.obs;

  bool get isFullFilled => email.value.isNotEmpty && password.value.isNotEmpty;
}

class LoginPageController extends GetxController {
  LoginPageController({
    required this.emailAuthLoginUsecase,
    required this.tokenAuthLoginUseCase,
  });

  final EmailAuthLoginUsecase emailAuthLoginUsecase;
  final TokenAuthLoginUseCase tokenAuthLoginUseCase;
  final _stateModel = _LoginPageStateModel();

  final pageState = RxStatus.empty().obs;

  late void Function(String message) onLoginErrorFunction;

  void setEmail(String value) {
    _stateModel.email.value = value;
  }

  void setPassword(String value) {
    _stateModel.password.value = value;
  }

  bool get isLoginButtonReady =>
      _stateModel.isFullFilled && _stateModel.email.value.isValidEmail;

  Future<UserModel?> doUserLogin() async {
    try {
      pageState.value = RxStatus.loading();
      final response = await emailAuthLoginUsecase.call(
          email: _stateModel.email.value, password: _stateModel.password.value);

      UserFirebaseInfo.instance.email = response?.user!.email;
      UserFirebaseInfo.instance.name = response?.user!.displayName;
      UserFirebaseInfo.instance.uid = response?.user!.uid;

      final prefs = await SharedPreferences.getInstance();
      prefs.setString('uid', response?.user!.uid ?? '');
      prefs.setString('name', response?.user!.displayName ?? '');
      prefs.setString('email', response?.user!.email ?? '');

      print(response?.user);

      //DO TOKEN LOGIN
      final tokenResponse =
          await tokenAuthLoginUseCase.call(token: response!.user!.uid);

      pageState.value = RxStatus.success();
      return tokenResponse;
    } on CustomException catch (e) {
      pageState.value = RxStatus.error();

      onLoginErrorFunction(e.message);
    }
    return null;
  }
}
