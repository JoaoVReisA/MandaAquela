import 'package:flutter/material.dart';
import 'package:manda_aquela/color_schemes.g.dart';
import 'package:manda_aquela/presenter/common/assets.dart';
import 'package:manda_aquela/presenter/common/text_styles.dart';
import 'package:manda_aquela/presenter/widgets/svg_and_text/svg_and_text.dart';

class InterestedCard extends StatelessWidget {
  const InterestedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 1,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sertanejo',
                style:
                    TextStyles.poppins14px700w.copyWith(color: AppColors.gray),
              ),
              const SizedBox(height: 8),
              Text(
                '21/07/2022',
                style:
                    TextStyles.poppins8px500w.copyWith(color: AppColors.gray),
              ),
              const SizedBox(height: 8),
              Text(
                '21/07/2022',
                style:
                    TextStyles.poppins8px500w.copyWith(color: AppColors.gray),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgAndText(
                dividerWidth: 8,
                iconSize: 20,
                assetName: Assets.money,
                text: Text(
                  'R\$ 900,00',
                  style: TextStyles.poppins10px500w
                      .copyWith(color: AppColors.green),
                ),
              ),
              const SizedBox(height: 5),
              SvgAndText(
                dividerWidth: 8,
                iconSize: 20,
                assetName: Assets.person,
                text: Text(
                  '2',
                  style: TextStyles.poppins14px700w
                      .copyWith(color: AppColors.gray),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
