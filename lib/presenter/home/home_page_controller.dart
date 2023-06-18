import 'package:get/get.dart';
import 'package:manda_aquela/data/models/user_model.dart';
import 'package:manda_aquela/domain/entities/event.dart';
import 'package:manda_aquela/domain/entities/musician.dart';
import 'package:manda_aquela/domain/entities/skill.dart';
import 'package:manda_aquela/domain/usecase/events/fetch_events_list_usecase.dart';
import 'package:manda_aquela/domain/usecase/login/token_auth_login_usecase.dart';
import 'package:manda_aquela/domain/usecase/musician/fetch_musician_list_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageController extends GetxController {
  HomePageController({
    required this.fetchMusicianListUsecase,
    required this.fetchEventsListUsecase,
    required this.tokenAuthLoginUseCase,
  });

  final FetchMusicianListUsecase fetchMusicianListUsecase;
  final FetchEventsListUsecase fetchEventsListUsecase;
  final TokenAuthLoginUseCase tokenAuthLoginUseCase;

  final musicianList = <Musician>[].obs;
  final eventsList = <Events>[].obs;

  final eventsAndMusicianList = <dynamic>[].obs;

  final userModel = Rxn<UserModel>();

  RxStatus pageState = RxStatus.empty();

  Future<void> _fetchMusicianList() async {
    if (musicianList.isNotEmpty) {
      return;
    }
    pageState = RxStatus.loading();
    final list = await fetchMusicianListUsecase();
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
    String uid = '';
    await SharedPreferences.getInstance()
        .then((value) => uid = value.getString('uid') ?? '');

    final response = await tokenAuthLoginUseCase.call(token: uid);
    userModel.value = response;
    print(userModel.value?.photoUrl);
  }
}
