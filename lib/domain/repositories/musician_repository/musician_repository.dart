import 'package:manda_aquela/domain/entities/musician.dart';

abstract class MusicianRepository {
  Future<List<Musician>> fetchMusicianList();
}
