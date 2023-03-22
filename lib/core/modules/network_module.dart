import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:manda_aquela/infrastructure/network/dio_http_service.dart';
import 'package:manda_aquela/infrastructure/network/http_error_handler.dart';

class NetworkModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<Dio>((i) => Dio(), export: true),
        Bind.singleton<HttpErrorHandler>((i) => DioHttpErrorHandler(),
            export: true),
        Bind.singleton<HttpService>((i) => DioHttpService(i(), i()),
            export: true),
      ];
}
