import 'package:get/get.dart';
import 'package:manda_aquela/domain/entities/event.dart';
import 'package:manda_aquela/domain/entities/musician.dart';
import 'package:manda_aquela/domain/usecase/events/fetch_events_list_usecase.dart';
import 'package:manda_aquela/domain/usecase/musician/fetch_musician_list_usecase.dart';

class SearchPageController extends GetxController {
  SearchPageController(
      {required this.fetchMusicianListUsecase,
      required this.fetchEventsListUsecase});

  final FetchMusicianListUsecase fetchMusicianListUsecase;
  final FetchEventsListUsecase fetchEventsListUsecase;

  final searchInput = ''.obs;

  void onChangeSearchInput(String value) {
    searchInput.value = value;
    filteredList.clear();
    filteredList.addAll(
      _eventsAndMusicianList.where(
        (element) {
          if (element is Musician) {
            if (element.name
                .toLowerCase()
                .contains(searchInput.value.toLowerCase())) {
              return true;
            }
            if (getSkillsString(element.skills)
                .toLowerCase()
                .contains(searchInput.value.toLowerCase())) {
              return true;
            }
          }
          if (element is Events) {
            if (element.name
                .toLowerCase()
                .contains(searchInput.value.toLowerCase())) {
              return true;
            }
          }
          return false;
        },
      ),
    );
  }

  final musicianList = <Musician>[].obs;
  final eventsList = <Events>[].obs;

  final _eventsAndMusicianList = <dynamic>[].obs;

  final filteredList = <dynamic>[].obs;

  List<dynamic> get eventsAndMusicianList => _eventsAndMusicianList.value;

  Future<void> fetchMusicianList() async {
    // pageState = RxStatus.loading();
    final list = await fetchMusicianListUsecase();
    musicianList.addAll(list);
    // pageState = RxStatus.success();
  }

  Future<void> fetchEventsList() async {
    // pageState = RxStatus.loading();

    final list = await fetchEventsListUsecase();
    eventsList.addAll(list);

    // pageState = RxStatus.success();
  }

  void generateEventsAndMusiciansList() async {
    await fetchMusicianList();
    await fetchEventsList();
    _eventsAndMusicianList.addAll(musicianList);
    _eventsAndMusicianList.addAll(eventsList);
    _eventsAndMusicianList.shuffle();
  }

  String getSkillsString(List<String> skills) {
    String skillsString = '';

    for (String skill in skills) {
      skillsString += '$skill-';
    }
    final strList = skillsString.split('');
    strList.removeLast();
    skillsString = strList.join();
    return skillsString;
  }
}
