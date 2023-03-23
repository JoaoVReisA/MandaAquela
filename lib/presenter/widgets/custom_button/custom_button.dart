import 'package:flutter/material.dart';
import 'package:manda_aquela/presenter/text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: const ButtonStyle(),
      onPressed: () {},
      child: Text(
        "Login",
        style: TextStyles.outfit18px700w,
      ),
    );
  }
}
