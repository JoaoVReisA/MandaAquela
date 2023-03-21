import 'package:flutter_modular/flutter_modular.dart';
import 'package:manda_aquela/core/modules/home_module.dart';
import 'package:manda_aquela/presenter/events/events_page.dart';
import 'package:manda_aquela/presenter/profile/profile_page.dart';

import '../../presenter/start/start_page.dart';

class StartModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (context, args) => const StartPage(),
      children: [
        ModuleRoute('/home', module: HomeModule()),
        ChildRoute('/profile', child: (_, __) => const ProfilePage()),
        ChildRoute('/events', child: (_, __) => const EventsPage()),
      ],
    ),
  ];
}
