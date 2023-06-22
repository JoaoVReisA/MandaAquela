import 'package:flutter/material.dart';
import 'package:manda_aquela/presenter/events/widget/bottom_sheets/interested_bottom_sheet.dart';
import 'package:manda_aquela/presenter/events/widget/event_card.dart';

import '../../../../domain/entities/event.dart';

class EventsTabView extends StatefulWidget {
  const EventsTabView({super.key, required this.eventsList});

  @override
  State<EventsTabView> createState() => _EventsTabViewState();

  final List<Events> eventsList;
}

class _EventsTabViewState extends State<EventsTabView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: widget.eventsList.length,
                itemBuilder: (context, index) {
                  return EventCard(
                    onTap: () => InterestedBottomSheet.show(
                        context, widget.eventsList[index].oportunities),
                    event: widget.eventsList[index],
                  );
                })
          ],
        ),
      ),
    );
  }
}
