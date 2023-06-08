import 'package:get/get.dart';
import 'package:manda_aquela/domain/entities/skill.dart';

class SelectYourSkillsPageController extends GetxController {
  SelectYourSkillsPageController();

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

  void getSkillsList() {
    skills.addAll(
      [
        Skill(skillName: 'Guitarra', isSelected: false),
        Skill(skillName: 'Piano', isSelected: false),
        Skill(skillName: 'Teclado', isSelected: false),
        Skill(skillName: 'Voz', isSelected: false),
        Skill(skillName: 'violão', isSelected: false),
        Skill(skillName: 'Saxofone', isSelected: false),
        Skill(skillName: 'Baixo', isSelected: false),
        Skill(skillName: 'Cavaquinho', isSelected: false),
        Skill(skillName: 'tambor', isSelected: false),
        Skill(skillName: 'Bateria', isSelected: false),
        Skill(skillName: 'Triangulo', isSelected: false),
        Skill(skillName: 'Dança', isSelected: false),
      ],
    );

    filteredList.addAll(skills);
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
