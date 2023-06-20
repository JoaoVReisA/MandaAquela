import 'package:manda_aquela/data/models/music_style_model.dart';

class MusicStyle {
  MusicStyle({required this.name, required this.id});
  final String id;
  final String name;

  MusicStyleModel toModel() => MusicStyleModel(
        id: id,
        name: name,
      );
}
