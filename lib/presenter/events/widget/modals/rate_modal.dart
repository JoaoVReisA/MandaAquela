import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manda_aquela/color_schemes.g.dart';
import 'package:manda_aquela/presenter/common/assets.dart';
import 'package:manda_aquela/presenter/common/text_styles.dart';

class RateModal extends StatelessWidget {
  const RateModal({
    super.key,
  });

  static Future<int?> show(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => const RateModal(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      elevation: 0,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Avalie como foi o trabalho com essa pessoa",
              textAlign: TextAlign.center,
              style: TextStyles.outfit25px700w,
            ),
            const SizedBox(height: 24),
            const RateButton(),
          ],
        ),
      ),
    );
  }
}

class RateButton extends StatefulWidget {
  const RateButton({super.key, required});

  @override
  State<RateButton> createState() => _RateButtonState();
}

class _RateButtonState extends State<RateButton> {
  int rate = 2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            for (var i = 0; i < 5; i++)
              GestureDetector(
                onTap: () {
                  if (mounted) {
                    setState(() {
                      rate = i + 1;
                    });
                  }
                },
                child: SvgPicture.asset(Assets.musicNote.path,
                    height: 50,
                    colorFilter: i < rate
                        ? null
                        : const ColorFilter.mode(
                            Colors.grey,
                            BlendMode.srcIn,
                          )),
              ),
          ]),
        ),
        const SizedBox(height: 24),
        GestureDetector(
          onTap: () {
            Navigator.pop(context, rate);
          },
          child: Text(
            "Feito!",
            style: TextStyles.outfit24px700w.copyWith(
              color: AppColors.primary,
              decoration: TextDecoration.underline,
            ),
          ),
        )
      ],
    );
  }
}
