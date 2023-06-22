import 'package:manda_aquela/domain/entities/rate_request.dart';
import 'package:manda_aquela/domain/repositories/events_repository/events_repository.dart';

abstract class RateEventUsecase {
  Future<void> call(RateRequest request);
}

class RemoteRateEvent implements RateEventUsecase {
  RemoteRateEvent(this.repository);

  final EventsRepository repository;

  @override
  Future<void> call(RateRequest request) async {
    await repository.rateEvent(request);
  }
}
