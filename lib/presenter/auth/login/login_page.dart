import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:manda_aquela/core/extensions/string_extensions.dart';
import 'package:manda_aquela/presenter/auth/login/controllers/login_page_controller.dart';
import 'package:manda_aquela/presenter/auth/widgets/social_media_button.dart';
import 'package:manda_aquela/presenter/common/assets.dart';
import 'package:manda_aquela/presenter/widgets/common_dialog/common_dialog.dart';
import 'package:manda_aquela/presenter/widgets/custom_button/custom_button.dart';
import 'package:manda_aquela/presenter/widgets/password_text_field/password_text_field.dart';

import '../../common/text_styles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginPageController _controller = Modular.get<LoginPageController>();

  @override
  void initState() {
    _controller.onLoginErrorFunction = _showErrorDialog;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(Assets.musician.path),
                  Text("Login", style: TextStyles.outfit30px700w),
                  const SizedBox(height: 16),
                  TextFormField(
                    style: TextStyles.outfit15px400w,
                    onChanged: _controller.setEmail,
                    decoration: const InputDecoration(
                      hintText: "Digite seu email",
                      label: Text("Email"),
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value != null) {
                        if (value.isValidEmail) {
                          return null;
                        }
                      }
                      return 'Por favor digite um e-mail válido';
                    },
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  PasswordTextField(
                    hintText: 'Digite a senha',
                    label: 'Senha',
                    onChanged: _controller.setPassword,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Modular.to.pushNamed('/auth/send_email');
                        },
                        child: Text(
                          "Esqueceu a senha ?",
                          style: TextStyles.outfit15px400w
                              .copyWith(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Visibility(
                    visible: !_controller.pageState.value.isLoading,
                    replacement: const SizedBox(
                      width: 50,
                      height: 50,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    child: CustomButton(
                      onPressed: _controller.isLoginButtonReady
                          ? () async {
                              final response = await _controller.doUserLogin();
                              if (response != null) {
                                if (response.isSignedUp ?? false) {
                                  Modular.to.navigate('/start/home');
                                } else {
                                  Modular.to.navigate(
                                      '/auth/is_musician_or_contractor');
                                }
                              }
                            }
                          : null,
                      label: "Login",
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 1.5,
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          "Ou entre com",
                          style: TextStyles.outfit15px400w.copyWith(
                              color: Theme.of(context).colorScheme.tertiary),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 1.5,
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      SocialMediaButton(assets: Assets.googleLogo),
                      SizedBox(
                        width: 16,
                      ),
                      SocialMediaButton(assets: Assets.facebookLogo),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  InkWell(
                    onTap: () {
                      Modular.to.pushNamed('/auth/sign_up');
                    },
                    child: RichText(
                        text: TextSpan(
                      text: 'Ainda não tem conta?',
                      style: TextStyles.outfit15px400w.copyWith(
                          color: Theme.of(context).colorScheme.surfaceVariant),
                      children: [
                        TextSpan(
                            text: ' Criar conta',
                            style: TextStyles.outfit15pxBold
                                .copyWith(color: Colors.black)),
                      ],
                    )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) => CommonDialog(
            title: 'Aconteceu um erro inesperado',
            bodyText: message,
            buttonText: 'Ok',
            onTap: () {
              Modular.to.pop();
            }));
  }
}
