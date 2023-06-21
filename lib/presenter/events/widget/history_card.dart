import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manda_aquela/color_schemes.g.dart';
import 'package:manda_aquela/presenter/common/assets.dart';
import 'package:manda_aquela/presenter/common/text_styles.dart';
import 'package:manda_aquela/presenter/widgets/svg_and_text/svg_and_text.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({super.key});

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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Festa junina',
                            style: TextStyles.poppins14px700w
                                .copyWith(color: AppColors.gray),
                          ),
                          const SizedBox(height: 8),
                          SvgAndText(
                            dividerWidth: 8,
                            iconSize: 16,
                            assetName: Assets.calendar,
                            text: Text(
                              '21/07/2022',
                              style: TextStyles.poppins8px500w
                                  .copyWith(color: AppColors.gray),
                            ),
                          ),
                          const SizedBox(height: 8),
                          SvgAndText(
                            dividerWidth: 6,
                            iconSize: 16,
                            assetName: Assets.alarm,
                            text: Text(
                              '18:30 - 21:30',
                              style: TextStyles.poppins8px500w
                                  .copyWith(color: AppColors.gray),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Column(
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
                ),
              ),
              Container(
                color: AppColors.yellow,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(Assets.star.path),
                      Text(
                        'Concluído',
                        style: TextStyles.poppins10px500w
                            .copyWith(color: AppColors.white),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
