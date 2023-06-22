import 'package:flutter/material.dart';
import 'package:manda_aquela/domain/entities/oportunity.dart';
import 'package:manda_aquela/presenter/events/widget/bottom_sheets/bottom_sheet_base.dart';
import 'package:manda_aquela/presenter/events/widget/simple_oportunity_card.dart';

class YouBottomSheet extends StatelessWidget {
  const YouBottomSheet(
      {super.key, required this.oportunities, required this.title});

  final List<Oportunity> oportunities;
  final String title;

  static Future<void> show(
      BuildContext context, List<Oportunity> oportunities, String title) async {
    await showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      isScrollControlled: true,
      context: context,
      builder: (context) => YouBottomSheet(
        oportunities: oportunities,
        title: title,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetBase(
      title: title,
      content: ListView.builder(
        itemCount: oportunities.length,
        shrinkWrap: true,
        itemBuilder: (context, index) => SimpleOportunityCard(
          oportunity: oportunities[index],
        ),
      ),
    );
  }
}
