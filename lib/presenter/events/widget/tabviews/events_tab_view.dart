import 'package:flutter/material.dart';
import 'package:manda_aquela/data/models/user_model.dart';
import 'package:manda_aquela/domain/entities/oportunity.dart';
import 'package:manda_aquela/presenter/events/widget/bottom_sheets/interested_bottom_sheet.dart';
import 'package:manda_aquela/presenter/events/widget/bottom_sheets/you_bottom_sheet.dart';
import 'package:manda_aquela/presenter/events/widget/event_card.dart';

import '../../../../domain/entities/event.dart';

class EventsTabView extends StatefulWidget {
  const EventsTabView({
    super.key,
    required this.eventsList,
    this.oportunities,
    required this.user,
  });

  @override
  State<EventsTabView> createState() => _EventsTabViewState();

  final List<Events> eventsList;
  final List<Oportunity>? oportunities;
  final UserModel user;
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
                    onTap: () {
                      if (widget.user.type == "contractor") {
                        InterestedBottomSheet.show(context,
                            _filter(widget.eventsList[index].oportunities));
                      } else {
                        YouBottomSheet.show(
                            context,
                            _filterMusician(
                                widget.eventsList[index].oportunities),
                            'Você se interessou!');
                      }
                    },
                    event: widget.eventsList[index],
                  );
                })
          ],
        ),
      ),
    );
  }

  _filter(List<Oportunity> oportunities) {
    return oportunities.where((e) => e.musicianId == null).toList();
  }

  _filterMusician(List<Oportunity> oportunities) {
    return oportunities.where((e) => e.musicianId == widget.user.id).toList();
  }
}
