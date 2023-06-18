import 'package:flutter/material.dart';
import 'package:manda_aquela/color_schemes.g.dart';
import 'package:manda_aquela/core/extensions/date_time_extensions.dart';
import 'package:manda_aquela/domain/entities/oportunity.dart';
import 'package:manda_aquela/presenter/common/text_styles.dart';
import 'package:manda_aquela/presenter/widgets/custom_button/custom_outlined_button.dart';

class OportunityCard extends StatelessWidget {
  const OportunityCard({super.key, required this.oportunity});

  final Oportunity oportunity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: kElevationToShadow[1],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                oportunity.name,
                style: TextStyles.outfit18px700w.copyWith(color: Colors.black),
              ),
              Text(
                'R\$ ${oportunity.value}',
                style: TextStyles.outfit18px400w
                    .copyWith(color: AppColors.success),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                oportunity.date.toFormattedString,
                style: TextStyles.outfit15px400w
                    .copyWith(color: AppColors.textGrey),
              ),
              Text(
                oportunity.musicStyle.first.name,
                style: TextStyles.outfit15px400w
                    .copyWith(color: AppColors.textGrey),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            oportunity.description,
            style:
                TextStyles.outfit15px400w.copyWith(color: AppColors.textGrey),
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              CustomOutlinedButton(
                label: 'Tenho interesse',
                onTap: () {},
              ),
              const Spacer()
            ],
          )
        ],
      ),
    );
  }
}
