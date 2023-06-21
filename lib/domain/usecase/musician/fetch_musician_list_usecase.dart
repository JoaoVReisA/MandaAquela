import 'package:manda_aquela/domain/entities/musician.dart';
import 'package:manda_aquela/domain/repositories/musician_repository/musician_repository.dart';

abstract class FetchMusicianListUsecase {
  Future<List<Musician>> call({required String musicianId});
}

class RemoteFetchMusicianListUsecase extends FetchMusicianListUsecase {
  RemoteFetchMusicianListUsecase({required this.repository});

  final MusicianRepository repository;

  @override
  Future<List<Musician>> call({required String musicianId}) {
    return repository.fetchMusicianList(musicianId: musicianId);
  }
}
