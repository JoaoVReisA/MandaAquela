import 'package:get/get.dart';
import 'package:manda_aquela/data/models/user_model.dart';
import 'package:manda_aquela/domain/entities/musician.dart';
import 'package:manda_aquela/domain/entities/oportunity.dart';
import 'package:manda_aquela/domain/usecase/events/accept_musician_usecase.dart';
import 'package:manda_aquela/domain/usecase/events/fetch_oportunity_musicians_usecase.dart';

class MusiciansPageController extends GetxController {
  MusiciansPageController({
    required this.fetchOportunityMusicians,
    required this.acceptMusicianUsecase,
  });

  final FetchOportunityMusiciansUsecase fetchOportunityMusicians;
  final RemoteAcceptMusician acceptMusicianUsecase;

  final musicianList = <Musician>[].obs;

  final userModel = Rxn<UserModel>();

  final pageState = RxStatus.empty().obs;
  final sendingState = RxStatus.empty().obs;

  Future<void> _fetchOportunityMusicians(List<String> ids) async {
    if (musicianList.isNotEmpty) {
      return;
    }

    if (ids.isEmpty) {
      return;
    }
    pageState.value = RxStatus.loading();

    final list = await fetchOportunityMusicians(ids);
    musicianList.addAll(list);

    pageState.value = RxStatus.success();
  }

  _getIdsFromOprotunityList(List<Oportunity> oportunityList) {
    List<String> ids = [];
    for (var element in oportunityList) {
      ids.add(element.musicianId ?? '');
    }
    return ids;
  }

  fetchMusiciansFromOportunityList(List<Oportunity> oportunityList) async {
    final ids = _getIdsFromOprotunityList(oportunityList);
    await _fetchOportunityMusicians(ids);
  }

  Future<void> acceptMusician(Musician musician, Oportunity oportunity) async {
    sendingState.value = RxStatus.loading();
    final result = await acceptMusicianUsecase(
      musician: musician,
      oportunity: oportunity,
    );
    sendingState.value = RxStatus.success();
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

  void initMusiciansPage(List<String> ids) async {
    await _fetchOportunityMusicians(ids);
  }
}
