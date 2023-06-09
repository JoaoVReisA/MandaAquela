import 'package:flutter_modular/flutter_modular.dart';
import 'package:manda_aquela/core/modules/auth_module.dart';
import 'package:manda_aquela/core/modules/events_module.dart';
import 'package:manda_aquela/core/modules/home_module.dart';
import 'package:manda_aquela/core/modules/network_module.dart';
import 'package:manda_aquela/core/modules/start_module.dart';
import 'package:manda_aquela/presenter/splash/splash_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<Module> get imports => [
        NetworkModule(),
        AuthModule(),
        HomeModule(),
        EventsModule(),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const SplashPage()),
        ModuleRoute('/home/', module: HomeModule()),
        ModuleRoute('/auth/', module: AuthModule()),
        ModuleRoute('/start/', module: StartModule()),
        ModuleRoute('/events/', module: EventsModule()),
      ];
}
