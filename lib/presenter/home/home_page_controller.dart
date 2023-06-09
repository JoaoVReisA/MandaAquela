import 'package:get/get.dart';
import 'package:manda_aquela/domain/entities/establishment.dart';
import 'package:manda_aquela/domain/entities/event.dart';
import 'package:manda_aquela/domain/entities/musician.dart';
import 'package:manda_aquela/domain/usecase/musician/fetch_musician_list_usecase.dart';

class HomePageController extends GetxController {
  HomePageController({required this.fetchMusicianListUsecase});

  final FetchMusicianListUsecase fetchMusicianListUsecase;

  final musicianList = <Musician>[].obs;
  final eventsList = <Events>[].obs;

  void fetchMusicianList() async {
    final list = await fetchMusicianListUsecase();
    musicianList.addAll(list);
    // musicianList.addAll([
    //   Musician(
    //       name: 'Thiaguinho',
    //       skills: ['Pagode', 'Violão', 'Canto'],
    //       imageUrl: 'imageUrl',
    //       rate: 4,
    //       value: 100.0),
    //   Musician(
    //     name: 'Jimmy hendrix',
    //     skills: ['Rock', 'Violão', 'guitarra'],
    //     imageUrl: 'imageUrl',
    //     rate: 5,
    //     value: 200.0,
    //   ),
    //   Musician(
    //     name: 'Pericles',
    //     skills: ['Pagode', 'Violão', 'Canto'],
    //     imageUrl: 'imageUrl',
    //     rate: 4,
    //     value: 100.0,
    //   ),
    // ]);
  }

  void fetchEventsList() {
    //TODO: add api call
    eventsList.addAll([
      Events(
        name: 'name',
        address: 'address',
        date: DateTime(2000),
        establishment: Establishment(
            name: 'Bar do bira',
            type: 'type',
            address: 'Endereço ',
            capacity: 35),
      ),
      Events(
        name: 'name',
        address: 'address',
        date: DateTime(2000),
        establishment: Establishment(
            name: 'Bar do bira',
            type: 'type',
            address: 'Endereço ',
            capacity: 35),
      ),
      Events(
        name: 'name',
        address: 'address',
        date: DateTime(2000),
        establishment: Establishment(
            name: 'Bar do bira',
            type: 'type',
            address: 'Endereço ',
            capacity: 35),
      ),
      Events(
        name: 'name',
        address: 'address',
        date: DateTime(2000),
        establishment: Establishment(
            name: 'Bar do bira',
            type: 'type',
            address: 'Endereço ',
            capacity: 35),
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
