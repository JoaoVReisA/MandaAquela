import 'package:flutter/material.dart';
import 'package:manda_aquela/domain/entities/oportunity.dart';
import 'package:manda_aquela/presenter/events/widget/bottom_sheets/bottom_sheet_base.dart';
import 'package:manda_aquela/presenter/events/widget/interested_card.dart';

class InterestedBottomSheet extends StatelessWidget {
  const InterestedBottomSheet({super.key, required this.oportunities});

  final List<Oportunity> oportunities;

  static Future<void> show(
      BuildContext context, List<Oportunity> oportunities) async {
    await showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      isScrollControlled: true,
      context: context,
      builder: (context) => InterestedBottomSheet(oportunities: oportunities),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetBase(
      title: 'Quem se interessou',
      content: ListView.builder(
        itemCount: oportunities.length,
        shrinkWrap: true,
        itemBuilder: (context, index) => GestureDetector(
            child: InterestedCard(
          oportunity: oportunities[index],
        )),
      ),
    );
  }
}
