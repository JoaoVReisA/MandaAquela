import 'package:manda_aquela/data/models/interest_model.dart';
import 'package:manda_aquela/domain/repositories/opportunity_repository.dart';

abstract class RegisterMusicianInterestOnOpportunityUseCase {
  Future<void> call({required InterestModel interest});
}

class RemoteRegisterMusicianInterestOnOpportunityUseCase
    implements RegisterMusicianInterestOnOpportunityUseCase {
  RemoteRegisterMusicianInterestOnOpportunityUseCase({
    required this.repository,
  });

  final OpportunityRepository repository;

  @override
  Future<void> call({required InterestModel interest}) async {
    try {
      await repository.registerMusicianInterestOnOpportunity(request: interest);
    } catch (e) {
      rethrow;
    }
  }
}
