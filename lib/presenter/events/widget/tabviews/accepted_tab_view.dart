import 'package:flutter/material.dart';
import 'package:manda_aquela/presenter/events/widget/bottom_sheets/accepted_musicians_bottomsheet.dart';

class AcceptedTabView extends StatelessWidget {
  const AcceptedTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => AcceptedMusiciansBottomSheet.show(context),
            child: Container(),
          ),
        ],
      ),
    );
  }
}
