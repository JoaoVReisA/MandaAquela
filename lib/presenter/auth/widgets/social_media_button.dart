import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manda_aquela/presenter/common/assets.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({required this.assets, super.key});
  final Assets assets;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context).colorScheme.shadow.withAlpha(40),
                  offset: const Offset(-0.6, 2))
            ],
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(8)),
        child: SvgPicture.asset(assets.path),
      ),
    );
  }
}
