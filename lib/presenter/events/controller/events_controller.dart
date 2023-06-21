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

  final userModel = Rxn<UserModel>();

  RxStatus pageState = RxStatus.empty();

  Future<void> fetchUserEventsList() async {
    if (eventsList.isNotEmpty) {
      return;
    }
    pageState = RxStatus.loading();

    final userId = await getUserId();
    final list = await fetchUserEvents(userId);
    eventsList.addAll(list);

    pageState = RxStatus.success();
  }

  Future<String> getUserId() async {
    final user = await getCachedUserDataUsecase();
    return user.id ?? '';
  }

  void initEventsPage() async {
    await fetchUserEventsList();
  }
}
