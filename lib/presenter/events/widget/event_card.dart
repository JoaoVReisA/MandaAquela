import 'package:flutter/material.dart';
import 'package:manda_aquela/color_schemes.g.dart';
import 'package:manda_aquela/presenter/common/assets.dart';
import 'package:manda_aquela/presenter/common/text_styles.dart';
import 'package:manda_aquela/presenter/widgets/svg_and_text/svg_and_text.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
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
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Festa junina',
                style:
                    TextStyles.poppins14px700w.copyWith(color: AppColors.gray),
              ),
              const SizedBox(height: 8),
              SvgAndText(
                dividerWidth: 8,
                iconSize: 16,
                assetName: Assets.calendar,
                text: Text(
                  '21/07/2022',
                  style:
                      TextStyles.poppins8px500w.copyWith(color: AppColors.gray),
                ),
              ),
              const SizedBox(height: 8),
              SvgAndText(
                dividerWidth: 6,
                iconSize: 16,
                assetName: Assets.alarm,
                text: Text(
                  '18:30 - 21:30',
                  style:
                      TextStyles.poppins8px500w.copyWith(color: AppColors.gray),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Column(
              children: [
                SvgAndText(
                  dividerWidth: 8,
                  iconSize: 20,
                  assetName: Assets.storefront,
                  text: Text(
                    'Bar do Bira',
                    style: TextStyles.poppins14px700w
                        .copyWith(color: AppColors.gray),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
