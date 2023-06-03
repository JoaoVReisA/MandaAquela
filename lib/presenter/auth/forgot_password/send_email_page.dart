import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:manda_aquela/color_schemes.g.dart';
import 'package:manda_aquela/presenter/auth/forgot_password/controllers/forgot_password_page_controller.dart';
import 'package:manda_aquela/presenter/common/assets.dart';
import 'package:manda_aquela/presenter/common/text_styles.dart';
import 'package:manda_aquela/presenter/widgets/custom_button/custom_button.dart';

class SendEmailPage extends StatefulWidget {
  const SendEmailPage({super.key});

  @override
  State<SendEmailPage> createState() => _SendEmailPageState();
}

class _SendEmailPageState extends State<SendEmailPage> {
  final _controller = Modular.get<ForgotPasswordPageController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Digite seu email',
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
                SvgPicture.asset(Assets.sendEmail.path),
                const SizedBox(
                  height: 24,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Você receberá um ',
                    style:
                        TextStyles.outfit18px400w.copyWith(color: Colors.grey),
                    children: [
                      TextSpan(
                        text: 'código ',
                        style: TextStyles.outfit18px700w
                            .copyWith(color: Colors.black),
                      ),
                      TextSpan(
                        text: 'por ',
                        style: TextStyles.outfit18px400w
                            .copyWith(color: Colors.grey),
                      ),
                      TextSpan(
                        text: 'email ',
                        style: TextStyles.outfit18px700w
                            .copyWith(color: AppColors.primary),
                      ),
                      TextSpan(
                        text: 'para prosseguir com a alteração da senha.',
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
                    onChanged: _controller.setEmail,
                    decoration: const InputDecoration(
                      hintText: "Digite seu email",
                      label: Text("Email"),
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
            child: CustomButton(
              onPressed: _controller.email.isNotEmpty
                  ? () async {
                      await _controller.onTapSendEmailButton();
                      Modular.to.pushNamed('/auth/input_email_code');
                    }
                  : null,
              label: "Enviar email",
            ),
          ),
        ),
      ),
    );
  }
}
