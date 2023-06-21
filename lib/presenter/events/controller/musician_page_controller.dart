import 'package:get/get.dart';
import 'package:manda_aquela/data/models/user_model.dart';
import 'package:manda_aquela/domain/entities/musician.dart';
import 'package:manda_aquela/domain/usecase/events/fetch_oportunity_musicians_usecase.dart';

class MusiciansPageController extends GetxController {
  MusiciansPageController({
    required this.fetchOportunityMusicians,
  });

  final FetchOportunityMusiciansUsecase fetchOportunityMusicians;

  final musicianList = <Musician>[].obs;

  final userModel = Rxn<UserModel>();

  RxStatus pageState = RxStatus.empty();

  Future<void> _fetchOportunityMusicians(List<String> ids) async {
    if (musicianList.isNotEmpty) {
      return;
    }

    if (ids.isEmpty) {
      return;
    }
    pageState = RxStatus.loading();

    final list = await fetchOportunityMusicians(ids);
    musicianList.addAll(list);

    pageState = RxStatus.success();
  }

  void initMusiciansPage(List<String> ids) async {
    await _fetchOportunityMusicians(ids);
  }
}
