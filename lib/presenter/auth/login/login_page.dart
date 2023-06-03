import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:manda_aquela/data/repositories/auth_login_repository.dart';
import 'package:manda_aquela/domain/usecase/login/email_auth_login_usecase.dart';
import 'package:manda_aquela/infrastructure/network/dio_http_service.dart';
import 'package:manda_aquela/infrastructure/network/http_error_handler.dart';
import 'package:manda_aquela/presenter/auth/login/controllers/login_page_controller.dart';
import 'package:manda_aquela/presenter/auth/widgets/social_media_button.dart';
import 'package:manda_aquela/presenter/common/assets.dart';
import 'package:manda_aquela/presenter/widgets/custom_button/custom_button.dart';

import '../../common/text_styles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //TODO: DEPENDENCIE INJECTION IS NOT WORKING FUCK IT I'M DRUNK AND IM NOT ACCOMPLISHING TO DO RESOLVE THIS SHIT DAMN
  //TODO: Serioulsly i don't fucking know what's going wrong with the dependencie injection
  late final LoginPageController _controller = LoginPageController(
      emailAuthLoginUsecase: RemoteEmailAuthLoginUsecase(
          repository: RemoteAuthLoginRepository(
              client: DioHttpService(Dio(), DioHttpErrorHandler()))));

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
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
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  onChanged: _controller.setPassword,
                  style: TextStyles.outfit15px400w,
                  decoration: const InputDecoration(
                    hintText: "Digite sua senha",
                    label: Text("Senha"),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Modular.to.pushNamed('/auth/forgot_password');
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
                CustomButton(
                  onPressed: _controller.isLoginButtonReady
                      ? () {
                          final response = _controller.onTapLoginButton();
                          if (response == null) {
                            Get.dialog(const Text('error'));
                          }
                          Modular.to
                              .navigate('/auth/is_musician_or_contractor');
                        }
                      : null,
                  label: "Login",
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    SocialMediaButton(assets: Assets.googleLogo),
                    SocialMediaButton(assets: Assets.facebookLogo),
                    SocialMediaButton(assets: Assets.appleLogo),
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
    );
  }
}
