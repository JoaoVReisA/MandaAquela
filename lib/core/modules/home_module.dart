import 'package:flutter_modular/flutter_modular.dart';
import 'package:manda_aquela/data/repositories/musician_repository.dart';
import 'package:manda_aquela/domain/repositories/musician_repository/musician_repository.dart';
import 'package:manda_aquela/domain/usecase/musician/fetch_musician_list_usecase.dart';
import 'package:manda_aquela/presenter/home/home_page_controller.dart';

import '../../presenter/home/home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<HomePageController>(
            (i) => HomePageController(fetchMusicianListUsecase: i())),
        Bind<FetchMusicianListUsecase>(
          (i) => RemoteFetchMusicianListUsecase(repository: i()),
        ),
        Bind<MusicianRepository>(
          (i) => MusicianRepositoryImpl(client: i()),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
      ];
}
