import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:manda_aquela/core/extensions/string_extensions.dart';
import 'package:manda_aquela/domain/usecase/forgot_password/send_email_code_usecase.dart';
import 'package:manda_aquela/presenter/widgets/common_dialog/common_dialog.dart';

class _ForgotPasswordStateModel {
  final email = ''.obs;
}

class ForgotPasswordPageController extends GetxController {
  ForgotPasswordPageController({
    required this.sendEmailCodeUsecase,
  });

  final _stateModel = _ForgotPasswordStateModel();
  final SendEmailCodeUsecase sendEmailCodeUsecase;

  void setEmail(String value) {
    _stateModel.email.value = value;
  }

  String get email => _stateModel.email.value;

  bool get isButtonReady => email.isValidEmail;

  Future<void> onTapSendEmailButton() async {
    try {
      await sendEmailCodeUsecase(email: email);
    } catch (e) {
      Get.dialog(CommonDialog(
          title: 'Aconteceu um erro inesperado',
          bodyText: 'Desculpe algo aconteceu e sua requisição ocorreu um erro',
          buttonText: 'Ok',
          onTap: () {
            Modular.to.pop();
          }));
    }
  }
}
