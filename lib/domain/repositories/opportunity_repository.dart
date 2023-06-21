import 'package:manda_aquela/data/models/interest_model.dart';
import 'package:manda_aquela/data/models/opportunity_request.dart';
import 'package:manda_aquela/domain/entities/music_style.dart';
import 'package:manda_aquela/domain/entities/oportunity.dart';

abstract class OpportunityRepository {
  Future<List<Oportunity>> fetchOpportunities();

  Future<List<MusicStyle>> fetchMusicStyles();

  Future<void> registerOpportunity({required OpportunityRequest request});

  Future<void> registerMusicianInterestOnOpportunity(
      {required InterestModel request});
}
