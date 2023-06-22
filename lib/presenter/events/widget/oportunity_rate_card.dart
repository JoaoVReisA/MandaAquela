import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:manda_aquela/color_schemes.g.dart';
import 'package:manda_aquela/core/formats/currency_format.dart';
import 'package:manda_aquela/domain/entities/event.dart';
import 'package:manda_aquela/domain/entities/musician.dart';
import 'package:manda_aquela/domain/entities/oportunity.dart';
import 'package:manda_aquela/domain/entities/rate_request.dart';
import 'package:manda_aquela/presenter/common/text_styles.dart';
import 'package:manda_aquela/presenter/events/widget/modals/rate_modal.dart';
import 'package:manda_aquela/presenter/events/widget/rating_component.dart';
import 'package:manda_aquela/presenter/widgets/success_snackbar.dart';

class OportunityRateCard extends StatelessWidget {
  const OportunityRateCard({
    super.key,
    required this.musician,
    required this.oportunity,
    required this.onTapName,
    required this.onSave,
    required this.event,
  });

  final Musician? musician;
  final Events event;
  final Oportunity oportunity;
  final Function(Musician musician) onTapName;
  final Future<void> Function(RateRequest request) onSave;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 1,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Container(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      oportunity.name,
                      style: TextStyles.outfit24px700w,
                    ),
                    const SizedBox(height: 10),
                    musician == null
                        ? const Text(
                            "Ninguém foi aceito para esse oportunidade",
                          )
                        : GestureDetector(
                            onTap: () {
                              Modular.to.pushNamed('/home/profile',
                                  arguments: onTapName(musician!));
                            },
                            child: Text(musician!.name,
                                style: TextStyles.poppins14px700w),
                          ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () async {
                        int? rate = await RateModal.show(context);

                        if (rate != null) {
                          await onSave(RateRequest(
                            contractorIdSender: event.contractorId,
                            oportunityId: oportunity.id,
                            musicianId: musician!.id,
                            stars: rate,
                          ));

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: AppColors.success,
                              content: SuccessSnackBar(
                                message: 'Evento cadastrado',
                              ),
                            ),
                          );

                          Modular.to.pop();
                          Modular.to.pushNamedAndRemoveUntil(
                            '/start/home/',
                            (p0) => false,
                          );
                        }
                      },
                      child: musician != null
                          ? _getButton(oportunity)
                          : Container(),
                    ),
                  ],
                ),
                Text(
                  CurrencyFormats.withSymbol
                      .format(double.parse(oportunity.value)),
                  style: TextStyles.outfit12px400w.copyWith(
                    color: AppColors.green,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  _getButton(Oportunity oportunity) {
    print(oportunity.feedback);
    return oportunity.feedback == null
        ? Text(
            'Avaliar',
            style: TextStyles.poppins14px700w.copyWith(
              color: AppColors.primary,
            ),
          )
        : RatingComponent(
            rate: oportunity.feedback!.stars,
          );
  }
}
