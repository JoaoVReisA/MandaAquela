import 'package:manda_aquela/domain/entities/music_style.dart';
import 'package:manda_aquela/domain/repositories/opportunity_repository.dart';

abstract class GetMusicStylesUseCase {
  Future<List<MusicStyle>> call();
}

class RemoteGetMusicStylesUseCase implements GetMusicStylesUseCase {
  RemoteGetMusicStylesUseCase({required this.repository});

  final OpportunityRepository repository;

  @override
  Future<List<MusicStyle>> call() async {
    return repository.fetchMusicStyles();
  }
}
