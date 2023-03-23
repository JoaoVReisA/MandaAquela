import 'package:manda_aquela/domain/repositories/AuthRepository/auth_login_repository.dart';
import 'package:manda_aquela/infrastructure/network/dio_http_service.dart';

class RemoteAuthLoginRepository extends AuthLoginRepository {
  RemoteAuthLoginRepository({required this.client});
  final HttpService client;
}
