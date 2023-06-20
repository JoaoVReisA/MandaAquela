import 'package:manda_aquela/data/models/opportunity_request.dart';
import 'package:manda_aquela/domain/repositories/opportunity_repository.dart';

abstract class RegisterOpportunityUseCase {
  Future<void> call({required OpportunityRequest request});
}

class RemoteRegisterOpportunityUseCase implements RegisterOpportunityUseCase {
  RemoteRegisterOpportunityUseCase({required this.repository});

  final OpportunityRepository repository;

  @override
  Future<void> call({required OpportunityRequest request}) async {
    await repository.registerOpportunity(request: request);
  }
}
