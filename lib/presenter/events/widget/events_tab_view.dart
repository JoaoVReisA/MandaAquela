import 'package:flutter/material.dart';
import 'package:manda_aquela/presenter/events/widget/event_card.dart';
import 'package:manda_aquela/presenter/events/widget/history_card.dart';
import 'package:manda_aquela/presenter/events/widget/interested_card.dart';

class EventsTabView extends StatelessWidget {
  const EventsTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          EventCard(),
          HistoryCard(),
          InterestedCard(),
        ],
      ),
    );
  }
}
