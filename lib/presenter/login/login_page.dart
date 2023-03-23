import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manda_aquela/presenter/assets.dart';
import 'package:manda_aquela/presenter/text_styles.dart';
import 'package:manda_aquela/presenter/widgets/custom_button/custom_button.dart';

import '../widgets/custom_text/custom_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            SvgPicture.asset(Assets.musician),
            Text("Login", style: TextStyles.outfit30px700w),
            const SizedBox(height: 16),
            TextFormField(
              style: TextStyles.outfit15px400w,
              decoration: const InputDecoration(
                  hintText: "Digite seu email", label: Text("Email")),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              style: TextStyles.outfit15px400w,
              decoration: const InputDecoration(
                hintText: "Digite sua senha",
                label: Text("Senha"),
              ),
            ),
            const CustomButton(),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: CustomText("Login"),
                )),
          ]),
        ),
      ),
    );
  }
}
