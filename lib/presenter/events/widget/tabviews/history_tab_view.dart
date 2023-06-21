import 'package:flutter/material.dart';
import 'package:manda_aquela/presenter/events/widget/history_card.dart';

class HistoryTabView extends StatelessWidget {
  const HistoryTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: const [
          HistoryCard(),
        ],
      ),
    );
  }
}
