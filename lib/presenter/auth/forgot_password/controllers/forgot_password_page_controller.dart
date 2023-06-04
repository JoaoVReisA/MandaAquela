import 'package:get/get.dart';
import 'package:manda_aquela/core/custom_exceptions.dart';
import 'package:manda_aquela/core/extensions/string_extensions.dart';
import 'package:manda_aquela/domain/usecase/forgot_password/send_email_code_usecase.dart';

class _ForgotPasswordStateModel {
  final email = ''.obs;
}

class ForgotPasswordPageController extends GetxController {
  ForgotPasswordPageController({
    required this.sendEmailCodeUsecase,
  });

  final _stateModel = _ForgotPasswordStateModel();
  final SendEmailCodeUsecase sendEmailCodeUsecase;

  late void Function(String message) onSendEmailError;

  void setEmail(String value) {
    _stateModel.email.value = value;
  }

  String get email => _stateModel.email.value;

  bool get isButtonReady => email.isValidEmail;

  Future<bool> onTapSendEmailButton() async {
    try {
      return await sendEmailCodeUsecase(email: email);
    } on CustomException catch (e) {
      onSendEmailError(e.message);
      return false;
    }
  }
}
