import 'package:get/get.dart';
import 'package:manda_aquela/core/extensions/string_extensions.dart';
import 'package:manda_aquela/domain/entities/user_request.dart';
import 'package:manda_aquela/domain/usecase/login/sign_up_usecase.dart';

class _SignUpPageStateModel {
  final name = ''.obs;
  final email = ''.obs;
  final password = ''.obs;
  final confirmPassword = ''.obs;

  bool get isFullFilled =>
      name.value.isNotEmpty &&
      email.value.isNotEmpty &&
      password.value.isNotEmpty &&
      confirmPassword.value.isNotEmpty;
}

class SignUpPageController extends GetxController {
  SignUpPageController({required this.signUpUsecase});
  final SignUpUsecase signUpUsecase;

  final _stateModel = _SignUpPageStateModel();

  void setName(String value) {
    _stateModel.name.value = value;
  }

  void setEmail(String value) {
    _stateModel.email.value = value;
  }

  void setPassword(String value) {
    _stateModel.password.value = value;
  }

  void setConfirmPassword(String value) {
    _stateModel.confirmPassword.value = value;
  }

  bool get isSignUpButtonReady =>
      _stateModel.isFullFilled &&
      _stateModel.email.value.isValidEmail &&
      _stateModel.password.value == _stateModel.confirmPassword.value;

  Future<bool> onTapReadyButton() async {
    final userRequest = UserRequest(
      name: _stateModel.name.value,
      email: _stateModel.email.value,
      password: _stateModel.password.value,
    );
    final response = await signUpUsecase.call(userRequest: userRequest);
    print(response);
    return response;
  }
}
