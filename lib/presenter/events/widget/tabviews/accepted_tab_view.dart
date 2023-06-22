// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:manda_aquela/domain/entities/event.dart';
import 'package:manda_aquela/presenter/events/widget/bottom_sheets/accepted_musicians_bottomsheet.dart';
import 'package:manda_aquela/presenter/events/widget/event_card.dart';

class AcceptedTabView extends StatelessWidget {
  const AcceptedTabView({
    Key? key,
    required this.eventsList,
  }) : super(key: key);

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
                  return EventCard(
                    onTap: () => AcceptedMusiciansBottomSheet.show(
                      context: context,
                      oportunities: eventsList[index].oportunities,
                    ),
                    event: eventsList[index],
                  );
                })
          ],
        ),
      ),
    );
  }
}
