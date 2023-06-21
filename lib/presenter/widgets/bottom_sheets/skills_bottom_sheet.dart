import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manda_aquela/color_schemes.g.dart';
import 'package:manda_aquela/domain/entities/skill.dart';
import 'package:manda_aquela/presenter/common/assets.dart';
import 'package:manda_aquela/presenter/common/text_styles.dart';
import 'package:manda_aquela/presenter/widgets/custom_button/custom_button.dart';

class SkillsBottomSheet extends StatelessWidget {
  const SkillsBottomSheet({super.key, required this.skills});

  final List<Skill> skills;
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
                "Habilidades",
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
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          Assets.musicalNoteIcon.path,
                          height: 32,
                          width: 32,
                        ),
                        const SizedBox(width: 8),
                        Text(skills[index].skillName),
                      ],
                    ),
                  );
                },
                itemCount: skills.length,
                shrinkWrap: true,
              ),
            ),
            const Spacer(),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
}
