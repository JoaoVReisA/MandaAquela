import 'dart:convert';

class InterestModel {
  InterestModel({
    required this.musicianId,
    required this.oportunityId,
  });
  final String musicianId;
  final String oportunityId;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'musicianId': musicianId,
      'oportunityId': oportunityId,
    };
  }

  factory InterestModel.fromMap(Map<String, dynamic> map) {
    return InterestModel(
      musicianId: map['musicianId'] as String,
      oportunityId: map['oportunityId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory InterestModel.fromJson(String source) =>
      InterestModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
