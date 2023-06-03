import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:manda_aquela/presenter/auth/forgot_password/controllers/forgot_password_page_controller.dart';
import 'package:manda_aquela/presenter/common/assets.dart';
import 'package:manda_aquela/presenter/common/text_styles.dart';
import 'package:manda_aquela/presenter/widgets/custom_button/custom_button.dart';
import 'package:manda_aquela/presenter/widgets/custom_button/custom_transparent_button.dart';

class InputEmailCodePage extends StatefulWidget {
  const InputEmailCodePage({super.key});

  @override
  State<InputEmailCodePage> createState() => _InputEmailCodePageState();
}

class _InputEmailCodePageState extends State<InputEmailCodePage> {
  final _controller = Modular.get<ForgotPasswordPageController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Digite o código',
            style: TextStyles.outfit30px700w.copyWith(color: Colors.black),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 24,
                ),
                SvgPicture.asset(Assets.sendCode.path),
                const SizedBox(
                  height: 24,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Digite o Código enviado para o email ',
                    style:
                        TextStyles.outfit18px400w.copyWith(color: Colors.grey),
                    children: [
                      TextSpan(
                        text: '${_controller.email} ',
                        style: TextStyles.outfit18px700w
                            .copyWith(color: Colors.black),
                      ),
                      TextSpan(
                        text: 'para validarmos sua conta.',
                        style: TextStyles.outfit18px400w
                            .copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    style:
                        TextStyles.outfit15px400w.copyWith(color: Colors.black),
                    onChanged: _controller.setCode,
                    decoration: const InputDecoration(
                      hintText: "Digite o código",
                      label: Text("Código"),
                    ),
                  ),
                ),
                const Spacer()
              ],
            ),
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomButton(
                  onPressed: _controller.code.isNotEmpty
                      ? () {
                          _controller.onTapSendCodeButton();
                          if (_controller.isCodeValid) {
                            Modular.to.navigate('/auth/forgot_password');
                          }
                        }
                      : null,
                  label: "Continuar",
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomTransparentButton(
                  onPressed: () {},
                  label: "Reenviar",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
