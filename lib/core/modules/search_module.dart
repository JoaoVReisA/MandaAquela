import 'package:flutter_modular/flutter_modular.dart';
import 'package:manda_aquela/presenter/search/controller/search_page_controller.dart';
import 'package:manda_aquela/presenter/search/search_page.dart';

class SearchModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<SearchPageController>((i) => SearchPageController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const SearchPage()),
      ];
}
