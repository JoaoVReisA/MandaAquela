import 'package:manda_aquela/domain/entities/musician.dart';
import 'package:manda_aquela/domain/entities/skill.dart';

abstract class MusicianRepository {
  Future<List<Musician>> fetchMusicianList();
  Future<List<Skill>> fetchSkillList();
}
