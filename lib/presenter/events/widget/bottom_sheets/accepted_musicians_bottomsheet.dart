import 'package:flutter/material.dart';
import 'package:manda_aquela/presenter/events/widget/bottom_sheets/bottom_sheet_base.dart';

class AcceptedMusiciansBottomSheet extends StatelessWidget {
  const AcceptedMusiciansBottomSheet({super.key});

  static Future<void> show(BuildContext context) async {
    await showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      isScrollControlled: true,
      context: context,
      builder: (context) => const AcceptedMusiciansBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheetBase(
      title: 'Quem se interessou',
      content: ListView.builder(
        itemCount: 2,
        shrinkWrap: true,
        itemBuilder: (context, index) => Container(),
      ),
    );
  }
}
