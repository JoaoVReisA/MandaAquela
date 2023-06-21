import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:manda_aquela/presenter/events/controller/events_controller.dart';
import 'package:manda_aquela/presenter/events/widget/event_card.dart';

class EventsTabView extends StatefulWidget {
  const EventsTabView({super.key});

  @override
  State<EventsTabView> createState() => _EventsTabViewState();
}

class _EventsTabViewState extends State<EventsTabView> {
  final _controller = Modular.get<EventsController>();

  @override
  void initState() {
    _controller.initEventsPage();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: _controller.eventsList.length,
                itemBuilder: (context, index) {
                  return EventCard(
                    event: _controller.eventsList[index],
                  );
                })
          ],
        ),
      ),
    );
  }
}
