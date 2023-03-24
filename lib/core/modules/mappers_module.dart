import 'package:flutter_modular/flutter_modular.dart';
import 'package:manda_aquela/data/mapper/model_response_mapper.dart';
import 'package:manda_aquela/data/mapper/response_mapper.dart';
import 'package:manda_aquela/data/models/model_response.dart';

class MappersModule extends Module {
  @override
  List<Bind> get binds => [
        Bind<ResponseMapper<ModelResponse>>((i) => i()),
        Bind<ModelResponseMapper>((i) => ModelResponseMapper()),
      ];
}
