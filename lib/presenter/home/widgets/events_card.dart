import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manda_aquela/color_schemes.g.dart';
import 'package:manda_aquela/domain/entities/event.dart';
import 'package:manda_aquela/presenter/common/assets.dart';
import 'package:manda_aquela/presenter/common/text_styles.dart';
import 'package:manda_aquela/presenter/widgets/custom_button/custom_button.dart';
import 'package:manda_aquela/presenter/widgets/custom_button/custom_outlined_button.dart';

class EventsCard extends StatelessWidget {
  const EventsCard({super.key, required this.event});

  final Events event;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(24),
        height: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              AppColors.highlight,
              AppColors.fadePink,
            ],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SvgPicture.asset(Assets.eventsPeople.path),
              const SizedBox(
                width: 16,
              ),
              Text(
                event.name,
                style: TextStyles.outfit18px700w.copyWith(color: Colors.white),
                overflow: TextOverflow.ellipsis,
              ),
            ]),
            const Spacer(),
            Row(
              children: [
                const Icon(
                  Icons.calendar_month,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  //TODO: ADD Date formatter
                  event.date.toString(),
                  style:
                      TextStyles.outfit15px400w.copyWith(color: Colors.white),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(
                  Icons.home_work,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  event.establishment?.name ?? '',
                  style:
                      TextStyles.outfit15px400w.copyWith(color: Colors.white),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  event.establishment?.address ?? '',
                  style:
                      TextStyles.outfit15px400w.copyWith(color: Colors.white),
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    onPressed: () {},
                    label: 'ir para evento',
                    height: 30,
                    textColor: AppColors.primary,
                    backgroundColor: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                    child: CustomOutlinedButton(
                        label: 'Oportunidade', onTap: () {}))
              ],
            )
          ],
        ),
      ),
    );
  }
}
