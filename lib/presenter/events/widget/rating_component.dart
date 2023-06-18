import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manda_aquela/presenter/common/assets.dart';

class RatingComponent extends StatelessWidget {
  const RatingComponent({super.key, required this.rate});
  final double rate;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Text(rate.toString()), _createRatingStars(rate)],
    );
  }
}

_createRatingStars(double rate) {
  final fullStars = rate.floor();
  return Row(children: [
    for (var i = 0; i < 5; i++)
      SvgPicture.asset(Assets.musicNote.path,
          colorFilter: i < fullStars
              ? null
              : const ColorFilter.mode(Colors.grey, BlendMode.srcIn)),
  ]);
}
