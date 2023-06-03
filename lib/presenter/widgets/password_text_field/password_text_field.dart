import 'package:flutter/material.dart';
import 'package:manda_aquela/presenter/common/text_styles.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField(
      {super.key, this.onChanged, this.hintText, this.label});

  final void Function(String)? onChanged;
  final String? hintText;
  final String? label;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      onChanged: widget.onChanged,
      style: TextStyles.outfit15px400w,
      decoration: InputDecoration(
        hintText: widget.hintText,
        label: Text(widget.label ?? ''),
        suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            icon: obscureText
                ? const Icon(Icons.visibility)
                : const Icon(Icons.visibility_off)),
      ),
    );
  }
}
