import 'package:flutter/material.dart';
import 'package:manda_aquela/presenter/common/text_styles.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton(
      {super.key, required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        side: const BorderSide(
          width: 2.0,
          color: Colors.white,
        ),
      ),
      child: Text(
        label,
        style: TextStyles.outfit18px700w.copyWith(color: Colors.white),
      ),
      // height: 30,
    );
  }
}
