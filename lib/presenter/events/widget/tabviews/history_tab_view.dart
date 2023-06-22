import 'package:flutter/material.dart';
import 'package:manda_aquela/domain/entities/event.dart';
import 'package:manda_aquela/presenter/events/widget/history_card.dart';

class HistoryTabView extends StatelessWidget {
  const HistoryTabView({super.key, required this.eventsList});

  final List<Events> eventsList;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: eventsList.length,
                itemBuilder: (context, index) {
                  return HistoryCard(
                    event: eventsList[index],
                  );
                })
          ],
        ),
      ),
    );
  }
}
