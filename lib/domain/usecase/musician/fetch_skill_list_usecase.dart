import 'package:manda_aquela/domain/entities/skill.dart';
import 'package:manda_aquela/domain/repositories/musician_repository/musician_repository.dart';

abstract class FetchSkillListUsecase {
  Future<List<Skill>> call();
}

class RemoteFetchSkillListUsecase extends FetchSkillListUsecase {
  RemoteFetchSkillListUsecase({required this.repository});

  final MusicianRepository repository;

  @override
  Future<List<Skill>> call() async {
    return await repository.fetchSkillList();
  }
}
