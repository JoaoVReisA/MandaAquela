import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manda_aquela/color_schemes.g.dart';
import 'package:manda_aquela/presenter/common/assets.dart';
import 'package:manda_aquela/presenter/common/text_styles.dart';
import 'package:manda_aquela/presenter/events/widget/interested_musician_card.dart';

class DetailsPageBase extends StatelessWidget {
  const DetailsPageBase({super.key});

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
                  'Sertanejo',
                  style: TextStyles.outfit24px700w,
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Lista de músicos interessados',
              style: TextStyles.poppins14px700w.copyWith(color: AppColors.gray),
            ),
            const SizedBox(height: 16),
            ListView.builder(
              itemCount: 2,
              shrinkWrap: true,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {},
                child: const InterestedMusicianCard(),
              ),
            )
          ],
        ),
      )),
    );
  }
}
