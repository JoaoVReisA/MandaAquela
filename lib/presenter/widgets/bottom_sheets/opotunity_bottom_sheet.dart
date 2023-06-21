import 'package:flutter/material.dart';
import 'package:manda_aquela/color_schemes.g.dart';
import 'package:manda_aquela/domain/entities/oportunity.dart';
import 'package:manda_aquela/presenter/common/text_styles.dart';
import 'package:manda_aquela/presenter/widgets/oportunity_card.dart';

class OportunityBottomSheet extends StatelessWidget {
  const OportunityBottomSheet(
      {super.key, required this.oportunities, this.onPressedInterest});

  final List<Oportunity> oportunities;
  final Function(String)? onPressedInterest;

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
          gradient: LinearGradient(
            colors: [
              AppColors.highlight,
              AppColors.fadePink,
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
        height: MediaQuery.of(context).size.height * 0.60,
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
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
                  "Oportunidades",
                  style:
                      TextStyles.outfit24px700w.copyWith(color: Colors.white),
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
                      child: OportunityCard(
                        oportunity: oportunities[index],
                        onPressed: () =>
                            onPressedInterest?.call(oportunities[index].id),
                      ),
                    );
                  },
                  itemCount: oportunities.length,
                  shrinkWrap: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
