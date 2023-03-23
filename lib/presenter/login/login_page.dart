import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manda_aquela/presenter/assets.dart';
import 'package:manda_aquela/presenter/text_styles.dart';
import 'package:manda_aquela/presenter/widgets/custom_button/custom_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SvgPicture.asset(Assets.musician),
        Text("Login", style: TextStyles.outfit30px700w),
        const SizedBox(height: 15),
        TextFormField(
          style: TextStyles.outfit15px400w,
          decoration: const InputDecoration(hintText: "Email"),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          style: TextStyles.outfit15px400w,
          decoration: const InputDecoration(hintText: "Senha"),
        ),
        const CustomButton()
      ]),
    );
  }
}
