import 'package:manda_aquela/data/models/event_request.dart';
import 'package:manda_aquela/domain/repositories/events_repository/events_repository.dart';

abstract class RegisterEventUseCase {
  Future<void> call({required EventRequest event});
}

class RemoteRegisterEventUseCase implements RegisterEventUseCase {
  RemoteRegisterEventUseCase({
    required this.eventRepository,
  });

  final EventsRepository eventRepository;

  @override
  Future<void> call({required EventRequest event}) async {
    await eventRepository.registerEvent(event: event);
  }
}
