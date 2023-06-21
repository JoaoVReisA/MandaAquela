// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';
import 'package:manda_aquela/data/models/opportunity_model.dart';
import 'package:manda_aquela/data/models/opportunity_request.dart';
import 'package:manda_aquela/domain/entities/music_style.dart';
import 'package:manda_aquela/domain/usecase/get_cached_user_data_usecase.dart';
import 'package:manda_aquela/domain/usecase/opportunity/get_music_styles_usecase.dart';
import 'package:manda_aquela/domain/usecase/opportunity/register_opportunity_usecase.dart';

class _RegisterOpportunityStateModel {
  final name = ''.obs;
  final date = Rxn<DateTime>();
  final city = ''.obs;
  final value = 0.0.obs;
  final event = ''.obs;
  final musicStyle = Rxn<MusicStyle>();
  final description = ''.obs;

  bool get isFulFilled =>
      name.value.isNotEmpty &&
      date.value != null &&
      city.value.isNotEmpty &&
      value.value != 0.0 &&
      event.value.isNotEmpty &&
      musicStyle.value != null &&
      description.value.isNotEmpty;
}

class RegisterOpportunityController extends GetxController {
  RegisterOpportunityController({
    required this.getCachedUserDataUsecase,
    required this.getMusicStylesUseCase,
    required this.registerOpportunityUseCase,
  });

  final GetCachedUserDataUsecase getCachedUserDataUsecase;

  final GetMusicStylesUseCase getMusicStylesUseCase;

  final RegisterOpportunityUseCase registerOpportunityUseCase;

  final _stateModel = _RegisterOpportunityStateModel();

  MusicStyle? get selectedMusicStyle => _stateModel.musicStyle.value;

  DateTime? get dateTime => _stateModel.date.value;

  final musicStyles = <MusicStyle>[].obs;

  void setName(String value) {
    _stateModel.name.value = value;
  }

  void setOpportunityDate(DateTime? value) {
    _stateModel.date.value = value;
  }

  void setCity(String value) {
    _stateModel.city.value = value;
  }

  void setValue(String value) {
    _stateModel.value.value = double.parse(value);
  }

  void setEvent(String value) {
    _stateModel.event.value = value;
  }

  void setOpportunityMusicStyle(MusicStyle? value) {
    _stateModel.musicStyle.value = value;
  }

  void setDescription(String value) {
    _stateModel.description.value = value;
  }

  void getMusicStyles() async {
    if (musicStyles.isNotEmpty) return;
    final list = await getMusicStylesUseCase();
    musicStyles.value = list;
  }

  Future<String> getUserId() async {
    final user = await getCachedUserDataUsecase();
    return user.id ?? '';
  }

  bool get isButtonReady => _stateModel.isFulFilled;

  Future<void> registerOpportunity() async {
    await registerOpportunityUseCase.call(
        request: OpportunityRequest(
      userType: 'contractor',
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
