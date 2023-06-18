import 'package:flutter/material.dart';
import 'package:manda_aquela/presenter/events/widget/bottom_sheets/interested_bottom_sheet.dart';
import 'package:manda_aquela/presenter/events/widget/event_card.dart';

class EventsTabView extends StatelessWidget {
  const EventsTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => InterestedBottomSheet.show(context),
            child: const EventCard(),
          ),
        ],
      ),
    );
  }
}
