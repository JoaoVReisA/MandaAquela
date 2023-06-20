import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manda_aquela/presenter/common/assets.dart';

class RateNotes extends StatelessWidget {
  const RateNotes({super.key, required this.rate});
  final int rate;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...buildFilledNotes(),
        ...buildRemainingNotes(),
      ],
    );
  }

  List<Widget> buildFilledNotes() {
    List<Widget> widgets = [];
    for (int i = 0; i < rate; i++) {
      widgets.add(SvgPicture.asset(Assets.musicalNoteIcon.path));
    }
    return widgets;
  }

  List<Widget> buildRemainingNotes() {
    List<Widget> widgets = [];

    if (rate < 5) {
      final difference = 5 - rate;
      for (int i = 0; i < difference; i++) {
        widgets.add(SvgPicture.asset(
          Assets.musicalNoteIcon.path,
          colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
        ));
      }
    }
    return widgets;
  }
}
