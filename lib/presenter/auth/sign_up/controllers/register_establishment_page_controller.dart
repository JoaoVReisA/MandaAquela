import 'package:get/get.dart';
import 'package:manda_aquela/domain/entities/establishment.dart';
import 'package:manda_aquela/domain/entities/establishment_type.dart';
import 'package:manda_aquela/domain/usecase/establishment/get_establishment_types_usecase.dart';

class _RegisterEstablishmentStateModel {
  final establishmentName = ''.obs;
  final establishmentTypes = <EstablishmentType>[].obs;

  final selectedEstablishmentType = Rxn<EstablishmentType?>(null);

  final address = ''.obs;
  final capacity = 0.obs;

  bool get isFullFilled =>
      establishmentName.value.isNotEmpty &&
      selectedEstablishmentType.value != null &&
      address.value.isNotEmpty &&
      capacity.value != 0;
}

class RegisterEstablishmentPageController extends GetxController {
  RegisterEstablishmentPageController(
      {required this.getEstablishmentTypesUseCase});

  final GetEstablishmentTypesUseCase getEstablishmentTypesUseCase;

  final _stateModel = _RegisterEstablishmentStateModel();

  bool get isButtonReady => _stateModel.isFullFilled;

  List<EstablishmentType> get establishmentTypes =>
      _stateModel.establishmentTypes.value;

  EstablishmentType? get selectedEstablishmentType =>
      _stateModel.selectedEstablishmentType.value;

  void setEstablishmentName(String value) {
    _stateModel.establishmentName.value = value;
  }

  void setEstablishmentType(EstablishmentType? value) {
    _stateModel.selectedEstablishmentType.value = value;
  }

  void setAddress(String value) {
    _stateModel.address.value = value;
  }

  void setCapacity(String value) {
    _stateModel.capacity.value = int.parse(value);
  }

  void getEstablishmentTypes() async {
    final list = await getEstablishmentTypesUseCase();
    _stateModel.establishmentTypes.value = list;
  }

  Establishment? getEstablishment() {
    if (_stateModel.isFullFilled) {
      return Establishment(
          name: _stateModel.establishmentName.value,
          type: [_stateModel.selectedEstablishmentType.value!],
          address: _stateModel.address.value,
          capacity: _stateModel.capacity.value);
    }
    return null;
  }
}
