import 'package:get/get.dart';
import 'package:manda_aquela/data/models/opportunity_model.dart';
import 'package:manda_aquela/data/models/opportunity_request.dart';
import 'package:manda_aquela/domain/entities/music_style.dart';
import 'package:manda_aquela/domain/usecase/get_cached_user_data_usecase.dart';
import 'package:manda_aquela/domain/usecase/opportunity/get_music_styles_usecase.dart';
import 'package:manda_aquela/domain/usecase/opportunity/register_opportunity_usecase.dart';

class _RegisterOpportunityStateModel {
  final name = ''.obs;
  final city = ''.obs;
  final value = 0.0.obs;
  final date = Rxn<DateTime>();
  final musicStyle = Rxn<MusicStyle>();
  final description = ''.obs;

  bool get isFulFilled =>
      name.value.isNotEmpty &&
      city.value.isNotEmpty &&
      value.value != 0.0 &&
      musicStyle.value != null &&
      description.value.isNotEmpty;
}

class RegisterMusicianOpportunityController extends GetxController {
  RegisterMusicianOpportunityController({
    required this.getCachedUserDataUsecase,
    required this.getMusicStylesUseCase,
    required this.registerOpportunityUseCase,
  });

  final GetCachedUserDataUsecase getCachedUserDataUsecase;

  final GetMusicStylesUseCase getMusicStylesUseCase;

  final RegisterOpportunityUseCase registerOpportunityUseCase;

  final _stateModel = _RegisterOpportunityStateModel();
  final musicStyles = <MusicStyle>[].obs;

  DateTime? get dateTime => _stateModel.date.value;

  MusicStyle? get selectedMusicStyle => _stateModel.musicStyle.value;

  void setOpportunityName(String value) {
    _stateModel.name.value = value;
  }

  void setOpportunityCity(String value) {
    _stateModel.city.value = value;
  }

  void setOpportunityValue(String value) {
    _stateModel.value.value = double.parse(value);
  }

  void setOpportunityMusicStyle(MusicStyle? value) {
    _stateModel.musicStyle.value = value;
  }

  void setOpportunityDescription(String value) {
    _stateModel.description.value = value;
  }

  void setOpportunityDate(DateTime? value) {
    _stateModel.date.value = value;
  }

  Future<String> getUserId() async {
    final user = await getCachedUserDataUsecase();
    return user.id ?? '';
  }

  void getMusicStyles() async {
    if (musicStyles.isNotEmpty) return;
    final list = await getMusicStylesUseCase();
    musicStyles.value = list;
  }

  Future<void> registerOpportunity() async {
    await registerOpportunityUseCase.call(
        request: OpportunityRequest(
      userType: 'musician',
      uuid: await getUserId(),
      opportunityModel: OpportunityModel(
        strDate: '',
        name: _stateModel.name.value,
        city: _stateModel.city.value,
        value: _stateModel.value.value.toString(),
        date: _stateModel.date.value!,
        musicStyle: [_stateModel.musicStyle.value!.toModel()],
        description: _stateModel.description.value,
        id: '',
      ),
    ));
  }
}
