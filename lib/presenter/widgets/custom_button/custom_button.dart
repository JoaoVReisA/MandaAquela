import 'package:flutter/material.dart';
import 'package:manda_aquela/presenter/common/text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.height,
    this.textColor,
    this.backgroundColor,
  });

  final VoidCallback? onPressed;
  final String label;
  final double? height;
  final Color? textColor;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 48,
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith(
              (states) {
                return backgroundColor;
              },
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: Colors.transparent)))),
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyles.outfit18px700w
              .copyWith(color: textColor ?? Colors.white),
        ),
      ),
    );
  }
}
