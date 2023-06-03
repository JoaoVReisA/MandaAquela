import 'package:flutter/material.dart';
import 'package:manda_aquela/presenter/common/text_styles.dart';
import 'package:manda_aquela/presenter/widgets/custom_button/custom_button.dart';

class CommonDialog extends StatelessWidget {
  const CommonDialog(
      {super.key,
      required this.title,
      required this.bodyText,
      required this.buttonText,
      required this.onTap});
  final String title;
  final String bodyText;
  final String buttonText;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      elevation: 0,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyles.outfit24px700w.copyWith(color: Colors.black),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              bodyText,
              style: TextStyles.outfit18px400w.copyWith(color: Colors.black),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 16,
            ),
            CustomButton(
              onPressed: onTap,
              label: buttonText,
            )
          ],
        ),
      ),
    );
  }
}
