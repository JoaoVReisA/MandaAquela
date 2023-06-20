import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:manda_aquela/color_schemes.g.dart';
import 'package:manda_aquela/presenter/common/assets.dart';
import 'package:manda_aquela/presenter/common/text_styles.dart';
import 'package:manda_aquela/presenter/widgets/custom_button/custom_button.dart';
import 'package:manda_aquela/presenter/widgets/custom_button/custom_outlined_button.dart';
import 'package:manda_aquela/presenter/widgets/rate/rate_notes.dart';

class MusicianCard extends StatelessWidget {
  const MusicianCard(
      {super.key,
      required this.musicianName,
      required this.musicianValue,
      required this.musicianRate,
      required this.skills,
      required this.genres,
      required this.onTapGoToProfile,
      required this.onTapContacts,
      required this.imageUrl});

  final String musicianName;
  final String musicianValue;
  final int musicianRate;
  final String skills;
  final String genres;
  final VoidCallback onTapGoToProfile;
  final VoidCallback onTapContacts;
  final String imageUrl;

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
                AppColors.fadePink,
                AppColors.fadeRed,
              ],
            )),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                imageUrl.isNotEmpty
                    ? SizedBox(
                        width: 150,
                        height: 150,
                        child: Image.network(
                          imageUrl,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            width: 150,
                            height: 150,
                          ),
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        width: 150,
                        height: 150,
                      ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      musicianName,
                      style: TextStyles.outfit18px700w
                          .copyWith(color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    RateNotes(rate: musicianRate),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          Assets.moneyIcon.path,
                          width: 16,
                        ),
                        SvgPicture.asset(
                          Assets.moneyIcon.path,
                          width: 16,
                        ),
                        SvgPicture.asset(
                          Assets.moneyIcon.path,
                          width: 16,
                        ),
                        SvgPicture.asset(
                          Assets.moneyIcon.path,
                          width: 16,
                        ),
                        SvgPicture.asset(
                          Assets.moneyIcon.path,
                          width: 16,
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            const Spacer(),
            Text(
              skills,
              style: TextStyles.outfit15px400w.copyWith(color: Colors.white),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Divider(
                color: Colors.white,
                height: 2,
                thickness: 2,
              ),
            ),
            Text(
              genres,
              style: TextStyles.outfit15px400w.copyWith(color: Colors.white),
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    onPressed: () {},
                    label: 'perfil',
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
                  label: 'Contato',
                  onTap: onTapContacts,
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
