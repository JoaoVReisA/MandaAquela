import 'package:flutter/material.dart';
import 'package:manda_aquela/color_schemes.g.dart';
import 'package:manda_aquela/presenter/common/text_styles.dart';

class EventsTabBar extends StatelessWidget {
  const EventsTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: TabBar(
        indicatorColor: Theme.of(context).colorScheme.primary,
        tabs: [
          Tab(
            child: Text(
              'Eventos',
              style: TextStyles.roboto12px500w.copyWith(color: AppColors.black),
            ),
          ),
          Tab(
            child: Text(
              'Aceitos',
              style: TextStyles.roboto12px500w.copyWith(color: AppColors.black),
            ),
          ),
          Tab(
            child: Text(
              'Histórico',
              style: TextStyles.roboto12px500w.copyWith(color: AppColors.black),
            ),
          ),
        ],
      ),
    );
  }
}
