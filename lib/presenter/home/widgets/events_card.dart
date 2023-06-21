import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manda_aquela/color_schemes.g.dart';
import 'package:manda_aquela/domain/entities/event.dart';
import 'package:manda_aquela/presenter/common/assets.dart';
import 'package:manda_aquela/presenter/common/text_styles.dart';
import 'package:manda_aquela/presenter/widgets/custom_button/custom_button.dart';
import 'package:manda_aquela/presenter/widgets/custom_button/custom_outlined_button.dart';

class EventsCard extends StatelessWidget {
  const EventsCard(
      {super.key,
      required this.event,
      required this.onTapGoToEvent,
      required this.onTapOportunity});

  final Events event;
  final VoidCallback onTapGoToEvent;
  final VoidCallback onTapOportunity;

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
              SizedBox(
                width: 110,
                child: Text(
                  event.name,
                  style:
                      TextStyles.outfit18px700w.copyWith(color: Colors.white),
                  overflow: TextOverflow.fade,
                  softWrap: false,
                ),
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
                  event.date,
                  style:
                      TextStyles.outfit15px400w.copyWith(color: Colors.white),
                ),
              ],
            ),
            Row(
              children: const [
                Icon(
                  Icons.home_work,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 4,
                ),
                // Text(
                //   event.establishment?.name ?? '',
                //   style:
                //       TextStyles.outfit15px400w.copyWith(color: Colors.white),
                // ),
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
                  event.locale,
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
                    onPressed: onTapGoToEvent,
                    label: 'Evento',
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
                    label: 'Oportunidade',
                    onTap: onTapOportunity,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
