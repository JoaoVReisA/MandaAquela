import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manda_aquela/presenter/auth/forgot_password/controllers/forgot_password_page_controller.dart';
import 'package:manda_aquela/presenter/common/assets.dart';
import 'package:manda_aquela/presenter/common/text_styles.dart';
import 'package:manda_aquela/presenter/widgets/custom_button/custom_button.dart';
import 'package:manda_aquela/presenter/widgets/password_text_field/password_text_field.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _controller = Modular.get<ForgotPasswordPageController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(Assets.forgotPassword.path),
              Text("Esqueci a senha", style: TextStyles.outfit30px700w),
              const Spacer(),
              PasswordTextField(
                hintText: "Nova senha",
                label: "Nova senha",
                onChanged: _controller.setPassword,
              ),
              const SizedBox(
                height: 16,
              ),
              PasswordTextField(
                hintText: "Confirmar senha",
                label: "Confirmar senha",
                onChanged: _controller.setConfirmPassword,
              ),
              const Spacer()
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: CustomButton(
            onPressed: _controller.isSendPasswordButtonReady
                ? () {
                    Modular.to.navigate('/start/');
                  }
                : null,
            label: "Enviar",
          ),
        ),
      ),
    );
  }
}
