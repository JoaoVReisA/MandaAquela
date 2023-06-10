import 'package:get/get.dart';
import 'package:manda_aquela/domain/entities/event.dart';
import 'package:manda_aquela/domain/entities/musician.dart';
import 'package:manda_aquela/domain/usecase/events/fetch_events_list_usecase.dart';
import 'package:manda_aquela/domain/usecase/musician/fetch_musician_list_usecase.dart';

class HomePageController extends GetxController {
  HomePageController(
      {required this.fetchMusicianListUsecase,
      required this.fetchEventsListUsecase});

  final FetchMusicianListUsecase fetchMusicianListUsecase;
  final FetchEventsListUsecase fetchEventsListUsecase;

  final musicianList = <Musician>[].obs;
  final eventsList = <Events>[].obs;

  final _eventsAndMusicianList = <dynamic>[].obs;

  RxStatus pageState = RxStatus.empty();

  List<dynamic> get eventsAndMusicianList => _eventsAndMusicianList.value;

  Future<void> fetchMusicianList() async {
    pageState = RxStatus.loading();
    final list = await fetchMusicianListUsecase();
    musicianList.addAll(list);
    pageState = RxStatus.success();
  }

  Future<void> fetchEventsList() async {
    pageState = RxStatus.loading();

    final list = await fetchEventsListUsecase();
    eventsList.addAll(list);

    pageState = RxStatus.success();
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
