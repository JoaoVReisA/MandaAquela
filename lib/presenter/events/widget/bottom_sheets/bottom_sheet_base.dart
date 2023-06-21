import 'package:flutter/material.dart';
import 'package:manda_aquela/color_schemes.g.dart';
import 'package:manda_aquela/presenter/common/text_styles.dart';
import 'package:manda_aquela/presenter/widgets/custom_button/custom_button.dart';

class BottomSheetBase extends StatelessWidget {
  const BottomSheetBase({
    super.key,
    required this.content,
    required this.title,
  });

  final Widget content;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          color: Colors.white,
        ),
        height: MediaQuery.of(context).size.height * 0.60,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 16),
              height: 4,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.lightGray,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                textAlign: TextAlign.start,
                title,
                style:
                    TextStyles.outfit25px700w.copyWith(color: AppColors.black),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: content,
            ),
            const Spacer(),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  label: 'Ok',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
