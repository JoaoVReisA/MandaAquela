import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: const [
              EventsTabBar(),
              Expanded(
                child: TabBarView(
                  children: [
                    EventsTabView(),
                    AcceptedTabView(),
                    HistoryTabView()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
