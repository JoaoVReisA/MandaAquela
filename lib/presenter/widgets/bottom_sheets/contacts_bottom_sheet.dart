import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manda_aquela/color_schemes.g.dart';
import 'package:manda_aquela/domain/entities/social_media.dart';
import 'package:manda_aquela/presenter/common/assets.dart';
import 'package:manda_aquela/presenter/common/text_styles.dart';
import 'package:manda_aquela/presenter/widgets/custom_button/custom_button.dart';

class ContactsBottomSheet extends StatelessWidget {
  const ContactsBottomSheet({super.key, required this.socialMedias});

  final List<SocialMedia> socialMedias;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(24),
        topRight: Radius.circular(24),
      ),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          color: Colors.white,
        ),
        height: MediaQuery.of(context).size.height * 0.60,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                textAlign: TextAlign.start,
                "Contato",
                style: TextStyles.outfit24px700w
                    .copyWith(color: AppColors.primary),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return socialMedias[index].link.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Row(
                            children: [
                              _buildSocialMediaIcon(socialMedias[index].type),
                              const SizedBox(width: 8),
                              Text(socialMedias[index].link),
                            ],
                          ),
                        )
                      : const SizedBox.shrink();
                },
                itemCount: socialMedias.length,
                shrinkWrap: true,
              ),
            ),
            const Spacer(),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomButton(
                  onPressed: () {
                    Modular.to.pop();
                  },
                  label: 'Ok',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSocialMediaIcon(String type) {
    switch (type) {
      case 'instagram':
        return SvgPicture.asset(
          Assets.instagramBlackLogo.path,
          height: 48,
          width: 48,
        );
      case 'facebook':
        return SvgPicture.asset(
          Assets.facebookBlackLogo.path,
          height: 48,
          width: 48,
        );
      case 'tiktok':
        return SvgPicture.asset(
          Assets.tikTokBlackLogo.path,
          height: 48,
          width: 48,
        );
      case 'youtube':
        return SvgPicture.asset(
          Assets.youtubeBlackLogo.path,
          height: 48,
          width: 48,
        );

      default:
        return SvgPicture.asset(
          Assets.youtubeBlackLogo.path,
          height: 48,
          width: 48,
        );
    }
  }
}
