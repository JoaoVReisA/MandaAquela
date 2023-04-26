import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manda_aquela/presenter/common/assets.dart';
import 'package:manda_aquela/presenter/common/text_styles.dart';

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
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: SvgPicture.asset(Assets.signUpStep.path)),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Criar Conta',
                style: TextStyles.outfit30px700w,
              ),
              const SizedBox(height: 16),
              TextFormField(
                style: TextStyles.outfit15px400w,
                decoration: const InputDecoration(
                    hintText: "Nome", label: Text("Nome")),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                style: TextStyles.outfit15px400w,
                decoration: const InputDecoration(
                  hintText: "Email",
                  label: Text("Email"),
                ),
              ),
              TextFormField(
                style: TextStyles.outfit15px400w,
                decoration: const InputDecoration(
                    hintText: "Senha", label: Text("Senha")),
              ),
              const SizedBox(
                height: 8,
              ),
              TextFormField(
                style: TextStyles.outfit15px400w,
                decoration: const InputDecoration(
                  hintText: "Confirmar senha",
                  label: Text("Confirmar senha"),
                ),
              ),
              SizedBox(
                  height: screenSize.height * 0.05,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Modular.to.navigate('/start/');
                    },
                    child: Text(
                      "Cadastrar-se",
                      style: TextStyles.outfit18px700w
                          .copyWith(color: Colors.white),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
