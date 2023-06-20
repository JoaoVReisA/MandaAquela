import 'package:flutter/material.dart';
import 'package:manda_aquela/color_schemes.g.dart';
import 'package:manda_aquela/domain/entities/skill.dart';

class SkillCard extends StatelessWidget {
  const SkillCard({
    super.key,
    required this.skill,
    required this.onTap,
  });

  final Skill skill;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(skill.skillName),
                skill.isSelected
                    ? const Icon(
                        Icons.done,
                        color: AppColors.success,
                      )
                    : const SizedBox.shrink()
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Divider(
              height: 1,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
