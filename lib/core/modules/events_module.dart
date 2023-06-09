import 'package:flutter_modular/flutter_modular.dart';
import 'package:manda_aquela/presenter/events/controller/register_event_controller.dart';
import 'package:manda_aquela/presenter/events/events_page.dart';
import 'package:manda_aquela/presenter/events/register_event.dart';

class EventsModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<RegisterEventController>((i) => RegisterEventController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const EventsPage()),
        ChildRoute('/register',
            child: (context, args) => const RegisterEvent()),
      ];
}
