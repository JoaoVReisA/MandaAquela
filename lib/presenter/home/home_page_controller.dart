import 'package:get/get.dart';
import 'package:manda_aquela/data/models/interest_model.dart';
import 'package:manda_aquela/data/models/user_model.dart';
import 'package:manda_aquela/domain/entities/event.dart';
import 'package:manda_aquela/domain/entities/musician.dart';
import 'package:manda_aquela/domain/entities/skill.dart';
import 'package:manda_aquela/domain/usecase/events/fetch_events_list_usecase.dart';
import 'package:manda_aquela/domain/usecase/get_cached_user_data_usecase.dart';
import 'package:manda_aquela/domain/usecase/musician/fetch_musician_list_usecase.dart';
import 'package:manda_aquela/domain/usecase/opportunity/register_musician_interest_on_opportunity_usecase.dart';

class HomePageController extends GetxController {
  HomePageController({
    required this.fetchMusicianListUsecase,
    required this.fetchEventsListUsecase,
    required this.getCachedUserDataUsecase,
    required this.registerMusicianInterestOnOpportunityUseCase,
  });

  final FetchMusicianListUsecase fetchMusicianListUsecase;
  final FetchEventsListUsecase fetchEventsListUsecase;
  final GetCachedUserDataUsecase getCachedUserDataUsecase;
  final RegisterMusicianInterestOnOpportunityUseCase
      registerMusicianInterestOnOpportunityUseCase;

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

  String getSkillsString(List<Skill> skillsP) {
    String skills = "";
    for (int i = 0; i < skillsP.length; i++) {
      skills += "${skillsP[i].skillName}-";
      if (i == 2) {
        break;
      }
    }
    return skills;
  }

  Future<void> getUserModel() async {
    final response = await getCachedUserDataUsecase.call();
    userModel.value = response;
    print("HOME PAGE $userModel");
  }

  UserModel buildUserModelFromMusician(Musician musician) {
    return UserModel(
      id: musician.id,
      name: musician.name,
      email: 'musician.email',
      photoUrl: musician.photoUrl,
      type: 'musician',
      address: musician.address.toModel(),
      description: musician.description,
      skills: musician.skills.map((e) => e.toModel()).toList(),
      rate: musician.rate,
      fee: musician.fee,
      socialMedia: musician.socialMedia,
    );
  }

  void registerInterest({required String oportunityId}) async {
    await registerMusicianInterestOnOpportunityUseCase(
        interest: InterestModel(
      musicianId: userModel.value?.id ?? '',
      oportunityId: oportunityId,
    ));
  }
}
