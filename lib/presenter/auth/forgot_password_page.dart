import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manda_aquela/presenter/common/assets.dart';
import 'package:manda_aquela/presenter/common/text_styles.dart';
import 'package:manda_aquela/presenter/widgets/custom_button/custom_button.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
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
              TextFormField(
                style: TextStyles.outfit15px400w,
                decoration: const InputDecoration(
                  hintText: "Nova senha",
                  label: Text("Nova senha"),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                style: TextStyles.outfit15px400w,
                decoration: const InputDecoration(
                  hintText: "Confirmar senha",
                  label: Text("Confirmar senha"),
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
            onPressed: () {
              Modular.to.navigate('/start/');
            },
            label: "Enviar",
          ),
        ),
      ),
    );
  }
}
