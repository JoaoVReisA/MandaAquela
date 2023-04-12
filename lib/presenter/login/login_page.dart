import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manda_aquela/presenter/assets.dart';
import 'package:manda_aquela/presenter/text_styles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
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
              SizedBox(
                  height: screenSize.height * 0.05,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Login",
                      style: TextStyles.outfit18px700w,
                    ),
                  )),
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
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
