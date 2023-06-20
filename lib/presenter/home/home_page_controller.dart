import 'package:get/get.dart';
import 'package:manda_aquela/data/models/user_model.dart';
import 'package:manda_aquela/domain/entities/event.dart';
import 'package:manda_aquela/domain/entities/musician.dart';
import 'package:manda_aquela/domain/entities/skill.dart';
import 'package:manda_aquela/domain/usecase/events/fetch_events_list_usecase.dart';
import 'package:manda_aquela/domain/usecase/get_cached_user_data_usecase.dart';
import 'package:manda_aquela/domain/usecase/musician/fetch_musician_list_usecase.dart';

class HomePageController extends GetxController {
  HomePageController({
    required this.fetchMusicianListUsecase,
    required this.fetchEventsListUsecase,
    required this.getCachedUserDataUsecase,
  });

  final FetchMusicianListUsecase fetchMusicianListUsecase;
  final FetchEventsListUsecase fetchEventsListUsecase;
  final GetCachedUserDataUsecase getCachedUserDataUsecase;

  final musicianList = <Musician>[].obs;
  final eventsList = <Events>[].obs;

  final eventsAndMusicianList = <dynamic>[].obs;

  final userModel = Rxn<UserModel>();

  RxStatus pageState = RxStatus.empty();

  String get userType => userModel.value?.type ?? 'musician';

  Future<void> _fetchMusicianList() async {
    if (musicianList.isNotEmpty) {
      return;
    }
    pageState = RxStatus.loading();
    final list =
        await fetchMusicianListUsecase(musicianId: userModel.value!.id!);
    musicianList.addAll(list);
    pageState = RxStatus.success();
  }

  Future<void> _fetchEventsList() async {
    if (eventsList.isNotEmpty) {
      return;
    }
    pageState = RxStatus.loading();

    final list = await fetchEventsListUsecase();
    eventsList.addAll(list);

    pageState = RxStatus.success();
  }

  void initHomePage() async {
    await getUserModel();
    await generateEventsAndMusiciansList();
  }

  Future<void> generateEventsAndMusiciansList() async {
    if (eventsAndMusicianList.isNotEmpty) {
      return;
    }
    await _fetchMusicianList();
    await _fetchEventsList();
    eventsAndMusicianList.addAll(musicianList);
    eventsAndMusicianList.addAll(eventsList);
    eventsAndMusicianList.shuffle();
  }

  String getSkillsString(List<Skill> skills) {
    String skillsString = '';

    for (Skill skill in skills) {
      skillsString += '${skill.skillName}-';
    }
    final strList = skillsString.split('');
    strList.removeLast();
    skillsString = strList.join();
    return skillsString;
  }

  Future<void> getUserModel() async {
    final response = await getCachedUserDataUsecase.call();
    userModel.value = response;
    print("HOME PAGE $userModel");
  }
}
