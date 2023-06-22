import 'package:flutter/material.dart';
import 'package:manda_aquela/color_schemes.g.dart';
import 'package:manda_aquela/core/extensions/date_time_extensions.dart';
import 'package:manda_aquela/core/formats/currency_format.dart';
import 'package:manda_aquela/domain/entities/oportunity.dart';
import 'package:manda_aquela/presenter/common/assets.dart';
import 'package:manda_aquela/presenter/common/text_styles.dart';
import 'package:manda_aquela/presenter/widgets/svg_and_text/svg_and_text.dart';

class SimpleOportunityCard extends StatelessWidget {
  const SimpleOportunityCard({super.key, required this.oportunity});

  final Oportunity oportunity;

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
      padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                oportunity.name,
                style:
                    TextStyles.poppins14px700w.copyWith(color: AppColors.gray),
              ),
              const SizedBox(height: 8),
              Text(
                oportunity.date.toFormattedString,
                style:
                    TextStyles.poppins10px500w.copyWith(color: AppColors.gray),
              ),
              const SizedBox(height: 8),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 100,
                child: SvgAndText(
                  dividerWidth: 8,
                  iconSize: 20,
                  assetName: Assets.money,
                  text: Text(
                    CurrencyFormats.withSymbol
                        .format(double.parse(oportunity.value)),
                    style: TextStyles.poppins10px500w
                        .copyWith(color: AppColors.green),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
