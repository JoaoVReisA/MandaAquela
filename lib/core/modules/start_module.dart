import 'package:flutter_modular/flutter_modular.dart';
import 'package:manda_aquela/core/modules/events_module.dart';
import 'package:manda_aquela/core/modules/home_module.dart';
import 'package:manda_aquela/core/modules/search_module.dart';

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
        ModuleRoute('/search', module: SearchModule()),
        ModuleRoute('/events', module: EventsModule()),
      ],
    ),
  ];
}
