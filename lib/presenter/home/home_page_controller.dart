import 'package:get/get.dart';
import 'package:manda_aquela/domain/entities/musician.dart';

class HomePageController extends GetxController {
  final musicianList = <Musician>[].obs;
  final _eventsList = <Musician>[].obs;

  void fetchMusicianList() {
    //TODO: add api call
    musicianList.addAll([
      Musician(
          name: 'Thiaguinho',
          skills: ['Pagode', 'Violão', 'Canto'],
          imageUrl: 'imageUrl',
          rate: 4,
          value: 100.0),
      Musician(
        name: 'Jimmy hendrix',
        skills: ['Rock', 'Violão', 'guitarra'],
        imageUrl: 'imageUrl',
        rate: 5,
        value: 200.0,
      ),
      Musician(
        name: 'Pericles',
        skills: ['Pagode', 'Violão', 'Canto'],
        imageUrl: 'imageUrl',
        rate: 4,
        value: 100.0,
      ),
    ]);
  }

  String getSkillsString(List<String> skills) {
    String skillsString = '';

    for (String skill in skills) {
      skillsString += '$skill-';
    }
    final strList = skillsString.split('');
    strList.removeLast();
    skillsString = strList.join();
    return skillsString;
  }
}
