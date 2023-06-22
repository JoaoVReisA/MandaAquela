import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:manda_aquela/domain/entities/musician.dart';
import 'package:manda_aquela/domain/entities/oportunity.dart';
import 'package:manda_aquela/presenter/common/text_styles.dart';
import 'package:manda_aquela/presenter/widgets/custom_button/custom_button.dart';
import 'package:manda_aquela/presenter/widgets/custom_button/custom_transparent_button.dart';

class AcceptMusicianModal extends StatelessWidget {
  const AcceptMusicianModal({
    super.key,
    required this.musician,
    required this.oportunity,
    required this.onAccept,
  });

  final Musician musician;
  final Oportunity oportunity;
  final Future<void> Function() onAccept;

  static Future<void> show(BuildContext context, Musician musician,
      Oportunity oportunity, Future<void> Function() onAccept) async {
    await showDialog(
      context: context,
      builder: (context) => AcceptMusicianModal(
        musician: musician,
        oportunity: oportunity,
        onAccept: onAccept,
      ),
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
              "Aceitar músico?",
              style: TextStyles.outfit25px700w,
            ),
            const SizedBox(height: 16),
            Text(
              "Tem certeza que quer aceitar ${musician.name} para a oportunidade?",
              textAlign: TextAlign.center,
              style: TextStyles.outfit18px400w,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    label: "Aceitar",
                    onPressed: onAccept,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomTransparentButton(
                    onPressed: () {
                      Modular.to.pop();
                    },
                    label: "Cancelar",
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
