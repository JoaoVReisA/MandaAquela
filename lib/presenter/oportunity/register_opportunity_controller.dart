import 'package:get/get.dart';

class _RegisterOpportunityStateModel {
  final name = ''.obs;
  final date = ''.obs;
  final city = ''.obs;
  final value = 0.0.obs;
  final event = ''.obs;
  final category = ''.obs;
  final description = ''.obs;

  bool get isFulFilled =>
      name.value.isNotEmpty &&
      date.value.isNotEmpty &&
      city.value.isNotEmpty &&
      value.value != 0.0 &&
      event.value.isNotEmpty &&
      category.value.isNotEmpty &&
      description.value.isNotEmpty;
}

class RegisterOpportunityController extends GetxController {
  final _stateModel = _RegisterOpportunityStateModel();

  void setName(String value) {
    _stateModel.name.value = value;
  }

  void setDate(String value) {
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

  void setCategory(String value) {
    _stateModel.category.value = value;
  }

  void setDescription(String value) {
    _stateModel.description.value = value;
  }

  bool get isButtonReady => _stateModel.isFulFilled;
}
