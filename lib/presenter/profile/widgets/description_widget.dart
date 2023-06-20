import 'package:flutter/material.dart';
import 'package:manda_aquela/color_schemes.g.dart';
import 'package:manda_aquela/presenter/common/text_styles.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: kElevationToShadow[2],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            "Descrição",
            style: TextStyles.outfit15px400w.copyWith(
              color: AppColors.primary,
            ),
            textAlign: TextAlign.start,
          ),
          const Divider(
            thickness: 2,
            color: AppColors.primary,
          ),
          Text(
            description,
            style: TextStyles.outfit15px400w.copyWith(
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 32)
        ],
      ),
    );
  }
}
