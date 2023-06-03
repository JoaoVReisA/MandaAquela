import 'package:get/get.dart';
import 'package:manda_aquela/domain/usecase/forgot_password/send_email_code_usecase.dart';
import 'package:manda_aquela/domain/usecase/forgot_password/send_reset_new_password_usecase.dart';
import 'package:manda_aquela/domain/usecase/forgot_password/verify_email_code_usecase.dart';

class _ForgotPasswordStateModel {
  final password = ''.obs;
  final confirmPassword = ''.obs;
  final emailCode = ''.obs;
  final email = ''.obs;
  final isCodeValid = false.obs;
}

class ForgotPasswordPageController extends GetxController {
  ForgotPasswordPageController({
    required this.sendEmailCodeUsecase,
    required this.sendResetNewPasswordUsecase,
    required this.verifyEmailCodeUsecase,
  });

  final _stateModel = _ForgotPasswordStateModel();
  final SendEmailCodeUsecase sendEmailCodeUsecase;
  final SendResetNewPasswordUsecase sendResetNewPasswordUsecase;
  final VerifyEmailCodeUsecase verifyEmailCodeUsecase;

  void setPassword(String value) {
    _stateModel.password.value = value;
  }

  void setConfirmPassword(String value) {
    _stateModel.confirmPassword.value = value;
  }

  void setCode(String value) {
    _stateModel.emailCode.value = value;
  }

  void setEmail(String value) {
    _stateModel.email.value = value;
  }

  void setIsCodeValid(bool value) {
    _stateModel.isCodeValid.value = value;
  }

  bool get isCodeValid => _stateModel.isCodeValid.value;
  String get email => _stateModel.email.value;

  String get password => _stateModel.password.value;

  bool get isSendPasswordButtonReady =>
      _stateModel.password.value.isNotEmpty &&
      _stateModel.confirmPassword.value.isNotEmpty;

  String get code => _stateModel.emailCode.value;

  void onTapSendPasswordButton() async {
    await sendResetNewPasswordUsecase(code: code, newPassword: password);
  }

  void onTapSendCodeButton() async {
    final response = await verifyEmailCodeUsecase(code: code);
    if (email == response) {
      setIsCodeValid(true);
    }
  }

  Future<void> onTapSendEmailButton() async {
    await sendEmailCodeUsecase(email: email);
  }
}
