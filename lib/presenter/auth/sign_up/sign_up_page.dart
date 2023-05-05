import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manda_aquela/presenter/common/assets.dart';
import 'package:manda_aquela/presenter/common/text_styles.dart';
import 'package:manda_aquela/presenter/widgets/custom_button/custom_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: SvgPicture.asset(Assets.signUpStep.path)),
                const SizedBox(
                  height: 15,
                ),
                Text('Criar Conta', style: TextStyles.outfit30px700w),
                const SizedBox(height: 16),
                TextFormField(
                  style: TextStyles.outfit15px400w,
                  decoration: const InputDecoration(
                    hintText: "Nome",
                    label: Text("Nome"),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                TextFormField(
                  style: TextStyles.outfit15px400w,
                  decoration: const InputDecoration(
                    hintText: "Email",
                    label: Text("Email"),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  style: TextStyles.outfit15px400w,
                  decoration: const InputDecoration(
                      hintText: "Senha", label: Text("Senha")),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  style: TextStyles.outfit15px400w,
                  decoration: const InputDecoration(
                    hintText: "Confirmar senha",
                    label: Text("Confirmar senha"),
                  ),
                ),
                const SizedBox(
                  height: 26,
                ),
                CustomButton(
                  onPressed: () {
                    Modular.to.navigate('/start/');
                  },
                  label: "Cadastrar-se",
                ),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    Modular.to.pop();
                  },
                  child: RichText(
                      text: TextSpan(
                    text: 'Já tem uma conta?',
                    style: TextStyles.outfit15px400w.copyWith(
                        color: Theme.of(context).colorScheme.surfaceVariant),
                    children: [
                      TextSpan(
                          text: ' Fazer login',
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
