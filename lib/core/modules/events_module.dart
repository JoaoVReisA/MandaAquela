import 'package:flutter_modular/flutter_modular.dart';
import 'package:manda_aquela/data/repositories/events_repository.dart';
import 'package:manda_aquela/data/repositories/opportunity_repository.dart';
import 'package:manda_aquela/domain/repositories/events_repository/events_repository.dart';
import 'package:manda_aquela/domain/repositories/opportunity_repository.dart';
import 'package:manda_aquela/domain/usecase/events/fetch_events_categories_usecase.dart';
import 'package:manda_aquela/domain/usecase/events/fetch_events_list_usecase.dart';
import 'package:manda_aquela/domain/usecase/events/register_event_usecase.dart';
import 'package:manda_aquela/domain/usecase/opportunity/get_music_styles_usecase.dart';
import 'package:manda_aquela/presenter/events/controller/register_event_controller.dart';
import 'package:manda_aquela/presenter/events/events_page.dart';
import 'package:manda_aquela/presenter/events/register_event.dart';
import 'package:manda_aquela/presenter/oportunity/register_opportunity_in_events_page.dart';

class EventsModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<RegisterEventController>(
          (i) => RegisterEventController(
            registerEventUseCase: i(),
            getCachedUserDataUsecase: i(),
            fetchEventsCategoriesUseCase: i(),
            getMusicStylesUseCase: i(),
          ),
        ),
        Bind.singleton<FetchEventsListUsecase>(
            (i) => RemoteFetchEventsListUsecase(repository: i()),
            export: true),
        Bind.singleton<EventsRepository>(
            (i) => EventsRepositoryImpl(client: i()),
            export: true),
        Bind<RegisterEventUseCase>(
          (i) => RemoteRegisterEventUseCase(eventRepository: i()),
        ),
        Bind<FetchEventsListUsecase>(
          (i) => RemoteFetchEventsListUsecase(
            repository: i(),
          ),
        ),
        Bind<FetchEventsCategoriesUseCase>(
          (i) => RemoteFetchEventsCategoriesUseCase(
            repository: i(),
          ),
        ),
        Bind<GetMusicStylesUseCase>(
            (i) => RemoteGetMusicStylesUseCase(
                  repository: i(),
                ),
            export: true),
        Bind<GetMusicStylesUseCase>(
            (i) => RemoteGetMusicStylesUseCase(
                  repository: i(),
                ),
            export: true),
        Bind<OpportunityRepository>(
            (i) => OpportunityRepositoryImpl(
                  service: i(),
                ),
            export: true),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const EventsPage()),
        ChildRoute('/register',
            child: (context, args) => const RegisterEvent()),
        ChildRoute('/register_opportunity',
            child: (context, args) => const RegisterOpportunityInEventsPage()),
      ];
}
