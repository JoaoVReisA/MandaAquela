import 'package:manda_aquela/domain/entities/musician.dart';
import 'package:manda_aquela/domain/repositories/events_repository/events_repository.dart';

abstract class FetchOportunityMusiciansUsecase {
  Future<List<Musician>> call(List<String> musicianInterestedIds);
}

class RemoteFetchOportunityMusicians
    implements FetchOportunityMusiciansUsecase {
  final EventsRepository repository;

  RemoteFetchOportunityMusicians(this.repository);
  @override
  Future<List<Musician>> call(List<String> musicianInterestedIds) async {
    return await repository.getOportunityMusicians(musicianInterestedIds);
  }
}
