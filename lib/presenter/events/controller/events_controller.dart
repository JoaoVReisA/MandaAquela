import 'package:get/get.dart';
import 'package:manda_aquela/data/models/user_model.dart';
import 'package:manda_aquela/domain/entities/event.dart';
import 'package:manda_aquela/domain/usecase/events/fetch_user_events.dart';
import 'package:manda_aquela/domain/usecase/get_cached_user_data_usecase.dart';

class EventsController extends GetxController {
  EventsController({
    required this.getCachedUserDataUsecase,
    required this.fetchUserEvents,
  });

  final FetchUserEventsUseCase fetchUserEvents;
  final GetCachedUserDataUsecase getCachedUserDataUsecase;

  final eventsList = <Events>[].obs;
  final acceptedEventsList = <Events>[].obs;
  final historyEventsList = <Events>[].obs;

  final userModel = Rxn<UserModel>();

  final pageState = RxStatus.empty().obs;

  Future<void> fetchUserEventsList() async {
    if (eventsList.isNotEmpty) {
      return;
    }
    pageState.value = RxStatus.loading();

    final userId = await getUserId();
    List<Events> list = await fetchUserEvents(userId);
    for (var event in list) {
      for (var opportunity in event.oportunities) {
        if (opportunity.musicianId != null) {
          acceptedEventsList.add(event);
          break;
        }
      }

      if (event.isClosed == true) {
        historyEventsList.add(event);
      } else {
        eventsList.add(event);
      }
    }

    pageState.value = RxStatus.success();
  }

  Future<String> getUserId() async {
    final user = await getCachedUserDataUsecase();
    return user.id ?? '';
  }

  void initEventsPage() async {
    await fetchUserEventsList();
  }
}
