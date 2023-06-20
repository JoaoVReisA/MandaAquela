// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:get/get.dart';
import 'package:manda_aquela/data/models/event_request.dart';
import 'package:manda_aquela/domain/entities/event_category.dart';
import 'package:manda_aquela/domain/entities/music_style.dart';
import 'package:manda_aquela/domain/entities/oportunity.dart';
import 'package:manda_aquela/domain/usecase/events/fetch_events_categories_usecase.dart';
import 'package:manda_aquela/domain/usecase/events/register_event_usecase.dart';
import 'package:manda_aquela/domain/usecase/get_cached_user_data_usecase.dart';
import 'package:manda_aquela/domain/usecase/opportunity/get_music_styles_usecase.dart';

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

class _RegisterOpportunityStateModel {
  final name = ''.obs;
  final city = ''.obs;
  final value = 0.0.obs;
  final musicStyle = Rxn<MusicStyle>();
  final description = ''.obs;

  bool get isFulFilled =>
      name.value.isNotEmpty &&
      city.value.isNotEmpty &&
      value.value != 0.0 &&
      musicStyle.value != null &&
      description.value.isNotEmpty;
}

class RegisterEventController extends GetxController {
  RegisterEventController(
      {required this.registerEventUseCase,
      required this.getCachedUserDataUsecase,
      required this.fetchEventsCategoriesUseCase,
      required this.getMusicStylesUseCase});

  final RegisterEventUseCase registerEventUseCase;
  final GetCachedUserDataUsecase getCachedUserDataUsecase;
  final FetchEventsCategoriesUseCase fetchEventsCategoriesUseCase;
  final GetMusicStylesUseCase getMusicStylesUseCase;

  final _stateModel = _RegisterEventStateModel();
  final _opportunityStateModel = _RegisterOpportunityStateModel();

  bool get isButtonReady => _stateModel.isFullFilled;

  bool get isOpportunityButtonReady => _opportunityStateModel.isFulFilled;

  DateTime? get dateTime => _stateModel.date.value;

  Oportunity? get opportunity => _stateModel.opportunity.value;

  EventCategory? get selectedCategory => _stateModel.category.value;

  MusicStyle? get selectedMusicStyle => _opportunityStateModel.musicStyle.value;

  final eventCategories = <EventCategory>[].obs;

  final musicStyles = <MusicStyle>[].obs;

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

  void setCategory(EventCategory? value) {
    _stateModel.category.value = value;
  }

  void setDescription(String value) {
    _stateModel.description.value = value;
  }

  void setOpportunityName(String value) {
    _opportunityStateModel.name.value = value;
  }

  void setOpportunityCity(String value) {
    _opportunityStateModel.city.value = value;
  }

  void setOpportunityValue(String value) {
    _opportunityStateModel.value.value = double.parse(value);
  }

  void setOpportunityMusicStyle(MusicStyle? value) {
    _opportunityStateModel.musicStyle.value = value;
  }

  void setOpportunityDescription(String value) {
    _opportunityStateModel.description.value = value;
  }

  void buildOpportunity() {
    _stateModel.opportunity.value = Oportunity(
      id: '',
      name: _opportunityStateModel.name.value,
      date: _stateModel.date.value ?? DateTime.now(),
      city: _opportunityStateModel.city.value,
      value: _opportunityStateModel.value.value.toString(),
      musicStyle: [_opportunityStateModel.musicStyle.value!],
      description: _opportunityStateModel.description.value,
    );
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
      date:
          '${_stateModel.date.value!.year}-${_stateModel.date.value!.month}-${_stateModel.date.value!.day}',
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

  void getMusicStyles() async {
    if (musicStyles.isNotEmpty) return;
    final list = await getMusicStylesUseCase();
    musicStyles.value = list;
  }
}
