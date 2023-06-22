import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manda_aquela/color_schemes.g.dart';
import 'package:manda_aquela/domain/entities/musician.dart';
import 'package:manda_aquela/domain/entities/oportunity.dart';
import 'package:manda_aquela/domain/entities/skill.dart';
import 'package:manda_aquela/presenter/common/assets.dart';
import 'package:manda_aquela/presenter/common/text_styles.dart';
import 'package:manda_aquela/presenter/events/widget/rating_component.dart';
import 'package:manda_aquela/presenter/widgets/svg_and_text/svg_and_text.dart';

class MusicianCard extends StatelessWidget {
  const MusicianCard(
      {super.key,
      required this.musician,
      required this.oportunity,
      required this.onTapImage});

  final Musician musician;
  final Oportunity oportunity;
  final VoidCallback onTapImage;

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
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: GestureDetector(
                          onTap: onTapImage,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.network(
                              fit: BoxFit.cover,
                              musician.photoUrl!,
                              width: 48,
                              height: 48,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              musician.name,
                              style: TextStyles.poppins10px700w
                                  .copyWith(color: AppColors.gray),
                            ),
                            const SizedBox(height: 8),
                            SvgAndText(
                              dividerWidth: 6,
                              iconSize: 16,
                              assetName: Assets.piano,
                              text: Expanded(
                                child: Text(
                                  _createSkillList(musician.skills),
                                  softWrap: false,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyles.poppins8px500w
                                      .copyWith(color: AppColors.gray),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RatingComponent(
                              rate: musician.rate,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                color: AppColors.green,
                constraints: const BoxConstraints(minWidth: 65),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(Assets.done.path),
                      Text(
                        'Aceito!',
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

  _createSkillList(List<Skill> skills) {
    String string = '';

    for (var e in skills) {
      string += '${e.skillName} ';
    }

    return string;
  }
}
