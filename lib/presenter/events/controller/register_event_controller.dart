// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:get/get.dart';
import 'package:manda_aquela/data/models/event_request.dart';
import 'package:manda_aquela/domain/entities/event_category.dart';
import 'package:manda_aquela/domain/entities/oportunity.dart';
import 'package:manda_aquela/domain/usecase/events/fetch_events_categories_usecase.dart';
import 'package:manda_aquela/domain/usecase/events/register_event_usecase.dart';
import 'package:manda_aquela/domain/usecase/get_cached_user_data_usecase.dart';

class _RegisterEventStateModel {
  final name = ''.obs;
  final date = Rxn<DateTime>();
  final place = ''.obs;
  final description = ''.obs;
  final capacity = 0.obs;
  final opportunity = Rxn<Oportunity>();
  final category = Rxn<EventCategory>();

  bool get isFullFilled =>
      name.value.isNotEmpty &&
      date.value != null &&
      place.value.isNotEmpty &&
      category.value != null &&
      description.value.isNotEmpty &&
      opportunity.value != null &&
      capacity.value != 0;
}

class RegisterEventController extends GetxController {
  RegisterEventController({
    required this.registerEventUseCase,
    required this.getCachedUserDataUsecase,
    required this.fetchEventsCategoriesUseCase,
  });

  final RegisterEventUseCase registerEventUseCase;
  final GetCachedUserDataUsecase getCachedUserDataUsecase;
  final FetchEventsCategoriesUseCase fetchEventsCategoriesUseCase;

  final _stateModel = _RegisterEventStateModel();

  bool get isButtonReady => _stateModel.isFullFilled;

  DateTime? get dateTime => _stateModel.date.value;

  final eventCategories = <EventCategory>[].obs;

  void setName(String value) {
    _stateModel.name.value = value;
  }

  void setDate(DateTime value) {
    _stateModel.date.value = value;
  }

  void setPlace(String value) {
    _stateModel.place.value = value;
  }

  void setCapacity(String value) {
    _stateModel.capacity.value = int.parse(value);
  }

  void setCategory(EventCategory value) {
    _stateModel.category.value = value;
  }

  Future<String> getUserId() async {
    final user = await getCachedUserDataUsecase();
    return user.id ?? '';
  }

  Future<void> registerEvent() async {
    final userId = await getUserId();

    final eventRequest = EventRequest(
      name: _stateModel.name.value,
      locale: _stateModel.place.value,
      date: _stateModel.date.value!.toIso8601String(),
      description: _stateModel.description.value,
      capacity: _stateModel.capacity.value,
      categoryId: _stateModel.category.value!.id,
      contractId: userId,
      opportunity: _stateModel.opportunity.value!.toModel(),
    );

    await registerEventUseCase(event: eventRequest);
  }

  void getEventsCategories() async {
    final list = await fetchEventsCategoriesUseCase();
    eventCategories.value = list;
  }
}
