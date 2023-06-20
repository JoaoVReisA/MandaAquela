import 'package:manda_aquela/domain/entities/music_style.dart';
import 'package:manda_aquela/domain/entities/oportunity.dart';

abstract class OpportunityRepository {
  Future<List<Oportunity>> fetchOpportunities();

  Future<List<MusicStyle>> fetchMusicStyles();
}
