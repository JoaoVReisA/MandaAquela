import 'package:flutter/material.dart';
import 'package:manda_aquela/color_schemes.g.dart';
import 'package:manda_aquela/domain/entities/event.dart';
import 'package:manda_aquela/presenter/common/assets.dart';
import 'package:manda_aquela/presenter/common/text_styles.dart';
import 'package:manda_aquela/presenter/widgets/svg_and_text/svg_and_text.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key, required this.event, required this.onTap});

  final Events event;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
                  event.name,
                  style: TextStyles.poppins14px700w
                      .copyWith(color: AppColors.gray),
                ),
                const SizedBox(height: 8),
                SvgAndText(
                  dividerWidth: 6,
                  iconSize: 20,
                  assetName: Assets.calendar,
                  text: Text(
                    _getLocaleDate(event.date),
                    style: TextStyles.poppins10px500w
                        .copyWith(color: AppColors.gray),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Column(
                children: [
                  Text(
                    event.locale,
                    style: TextStyles.poppins14px700w
                        .copyWith(color: AppColors.gray),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _getLocaleDate(String date) {
    final dateSplitted = date.split('-');
    return dateSplitted.reversed.join('/');
  }
}
