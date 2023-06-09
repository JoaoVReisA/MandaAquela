import 'package:flutter_modular/flutter_modular.dart';
import 'package:manda_aquela/presenter/home/home_page_controller.dart';

import '../../presenter/home/home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<HomePageController>((i) => HomePageController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
      ];
}
