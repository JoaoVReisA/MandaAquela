import 'package:get/get.dart';
import 'package:manda_aquela/domain/entities/skill.dart';
import 'package:manda_aquela/domain/usecase/musician/fetch_skill_list_usecase.dart';

class SelectYourSkillsPageController extends GetxController {
  SelectYourSkillsPageController({required this.fetchSkillListUsecase});

  final FetchSkillListUsecase fetchSkillListUsecase;

  final skills = <Skill>[].obs;

  final _inputValue = ''.obs;

  final filteredList = <Skill>[].obs;

  bool get isButtonReady => selectedList()?.isNotEmpty ?? false;

  void onChangedInputText(String value) {
    _inputValue.value = value;
    final list = skills.where((e) =>
        e.skillName.toLowerCase().contains(_inputValue.value.toLowerCase()));
    filteredList.clear();
    filteredList.addAll(list);
  }

  void selectElement(Skill element) {
    if (element.isSelected) {
      skills.firstWhere((e) {
        if (e == element) {
          e.isSelected = element.isSelected;
          return true;
        }
        return false;
      });
    }
  }

  void getSkillsList() async {
    try {
      final list = await fetchSkillListUsecase();
      skills.addAll(list);
      filteredList.addAll(skills);
    } catch (e) {
      print(e);
    }
  }

  List<Skill?>? selectedList() {
    final list = skills.map((element) {
      if (element.isSelected) {
        return element;
      }
    }).toList();

    list.removeWhere(
      (element) => element == null,
    );
    if (list.isEmpty) {
      return null;
    }
    return list;
  }
}
