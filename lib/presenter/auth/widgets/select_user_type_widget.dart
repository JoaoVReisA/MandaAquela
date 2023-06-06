import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manda_aquela/domain/entities/user_type.dart';
import 'package:manda_aquela/presenter/common/assets.dart';
import 'package:manda_aquela/presenter/common/text_styles.dart';

class SelectUserTypeWidget extends StatelessWidget {
  const SelectUserTypeWidget(
      {super.key,
      required this.userType,
      required this.isSelected,
      required this.onTap});

  final UserType userType;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(),
            Text(
              userType == UserType.musician
                  ? 'Sou Músico: '
                  : 'Sou Contratante',
              style: TextStyles.outfit15px400w,
            ),
            isSelected
                ? SvgPicture.asset(Assets.check.path)
                : const SizedBox.shrink(),
            const Spacer(),
          ],
        ),
        GestureDetector(
          onTap: onTap,
          child: Image.asset(
            userType == UserType.musician
                ? Assets.musicianDisplay.path
                : Assets.contractorDisplay.path,
            colorBlendMode: isSelected ? null : BlendMode.color,
            color: isSelected ? null : Colors.grey[600],
          ),
        ),
      ],
    );
  }
}
