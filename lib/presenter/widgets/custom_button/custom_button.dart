import 'package:flutter/material.dart';
import 'package:manda_aquela/presenter/common/text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.label});

  final VoidCallback? onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyles.outfit18px700w.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
