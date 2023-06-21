import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manda_aquela/presenter/common/assets.dart';

class SvgAndText extends StatelessWidget {
  const SvgAndText(
      {super.key,
      required this.assetName,
      required this.text,
      required this.dividerWidth,
      this.iconSize = 18,
      this.iconColor});

  final Assets assetName;
  final Widget text;
  final double dividerWidth;
  final double iconSize;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(assetName.path,
            height: iconSize,
            colorFilter: iconColor != null
                ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
                : null),
        SizedBox(width: dividerWidth),
        text,
      ],
    );
  }
}
