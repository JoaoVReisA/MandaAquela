import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:manda_aquela/presenter/events/controller/events_controller.dart';
import 'package:manda_aquela/presenter/events/widget/events_tab_bar.dart';
import 'package:manda_aquela/presenter/events/widget/tabviews/accepted_tab_view.dart';
import 'package:manda_aquela/presenter/events/widget/tabviews/events_tab_view.dart';
import 'package:manda_aquela/presenter/events/widget/tabviews/history_tab_view.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  final _controller = Modular.get<EventsController>();

  @override
  void initState() {
    _controller.initEventsPage();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_controller.pageState.value.isLoading) {
        return const Center(child: CircularProgressIndicator());
      }

      return DefaultTabController(
        length: 3,
        child: SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                const EventsTabBar(),
                Expanded(
                  child: TabBarView(
                    children: [
                      EventsTabView(
                        eventsList: _controller.eventsList,
                      ),
                      AcceptedTabView(
                          eventsList: _controller.acceptedEventsList),
                      HistoryTabView(eventsList: _controller.historyEventsList),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
