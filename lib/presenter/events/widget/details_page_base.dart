import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manda_aquela/presenter/common/assets.dart';
import 'package:manda_aquela/presenter/common/text_styles.dart';

class DetailsPageBase extends StatelessWidget {
  const DetailsPageBase(
      {super.key, required this.title, required this.content});

  final String title;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          SvgPicture.asset(Assets.backButton.path, height: 20)),
                ),
                const Spacer(),
                Text(
                  title,
                  style: TextStyles.outfit24px700w,
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 16),
            content
          ],
        ),
      )),
    );
  }
}
