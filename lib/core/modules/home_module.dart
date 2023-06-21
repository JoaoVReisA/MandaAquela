import 'package:flutter_modular/flutter_modular.dart';
import 'package:manda_aquela/data/repositories/musician_repository.dart';
import 'package:manda_aquela/data/repositories/opportunity_repository.dart';
import 'package:manda_aquela/domain/repositories/musician_repository/musician_repository.dart';
import 'package:manda_aquela/domain/repositories/opportunity_repository.dart';
import 'package:manda_aquela/domain/usecase/get_cached_user_data_usecase.dart';
import 'package:manda_aquela/domain/usecase/musician/fetch_musician_list_usecase.dart';
import 'package:manda_aquela/domain/usecase/musician/fetch_skill_list_usecase.dart';
import 'package:manda_aquela/domain/usecase/opportunity/register_musician_interest_on_opportunity_usecase.dart';
import 'package:manda_aquela/domain/usecase/opportunity/register_opportunity_usecase.dart';
import 'package:manda_aquela/presenter/home/home_page_controller.dart';
import 'package:manda_aquela/presenter/oportunity/register_contractor_oportunity.dart';
import 'package:manda_aquela/presenter/oportunity/register_contractor_opportunity_controller.dart';
import 'package:manda_aquela/presenter/oportunity/register_musician_opportunity_controller.dart';
import 'package:manda_aquela/presenter/oportunity/register_musician_opportunity_page.dart';
import 'package:manda_aquela/presenter/profile/controller/profile_page_controller.dart';
import 'package:manda_aquela/presenter/profile/profile_page.dart';

import '../../presenter/home/home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<HomePageController>(
          (i) => HomePageController(
              getCachedUserDataUsecase: i(),
              fetchMusicianListUsecase: i(),
              fetchEventsListUsecase: i(),
              registerMusicianInterestOnOpportunityUseCase: i()),
          export: true,
        ),
        Bind<FetchMusicianListUsecase>(
            (i) => RemoteFetchMusicianListUsecase(repository: i()),
            export: true),
        Bind<FetchSkillListUsecase>(
          (i) => RemoteFetchSkillListUsecase(repository: i()),
          export: true,
        ),
        Bind<MusicianRepository>((i) => MusicianRepositoryImpl(client: i()),
            export: true),
        Bind<RegisterOpportunityController>(
          (i) => RegisterOpportunityController(
            getCachedUserDataUsecase: i(),
            getMusicStylesUseCase: i(),
            registerOpportunityUseCase: i(),
            fetchUserEvents: i(),
          ),
          export: true,
        ),
        Bind<GetCachedUserDataUsecase>(
          (i) => LocalGetCachedUserDataUsecase(),
          export: true,
        ),
        Bind<ProfilePageController>(
          (i) => ProfilePageController(
            getCachedUserData: i(),
          ),
          export: true,
        ),
        Bind<RegisterOpportunityUseCase>(
          (i) => RemoteRegisterOpportunityUseCase(
            repository: i(),
          ),
          export: true,
        ),
        Bind<RegisterMusicianOpportunityController>(
          (i) => RegisterMusicianOpportunityController(
            getCachedUserDataUsecase: i(),
            getMusicStylesUseCase: i(),
            registerOpportunityUseCase: i(),
          ),
          export: true,
        ),
        Bind<OpportunityRepository>(
            (i) => OpportunityRepositoryImpl(
                  service: i(),
                ),
            export: true),
        Bind<RegisterMusicianInterestOnOpportunityUseCase>(
            (i) => RemoteRegisterMusicianInterestOnOpportunityUseCase(
                  repository: i(),
                ),
            export: true),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const HomePage()),
        ChildRoute('/register_opportunity',
            child: (context, args) => const RegisterOpportunity()),
        ChildRoute('/register_opportunity_musician',
            child: (context, args) => const RegisterMusicianOpportunityPage()),
        ChildRoute('/profile',
            child: (context, args) => ProfilePage(
                  userModel: args.data,
                )),
      ];
}
