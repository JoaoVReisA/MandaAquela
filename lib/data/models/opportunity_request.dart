// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:manda_aquela/data/models/opportunity_model.dart';

class OpportunityRequest {
  OpportunityRequest(
      {required this.uuid,
      required this.userType,
      this.eventId,
      required this.opportunityModel});

  final String uuid;
  final String userType;
  final String? eventId;
  final OpportunityModel opportunityModel;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uuid': uuid,
      'userType': userType,
      'eventId': eventId,
      'oportunity': opportunityModel.toMap(),
    };
  }

  factory OpportunityRequest.fromMap(Map<String, dynamic> map) {
    return OpportunityRequest(
      uuid: map['uuid'] as String,
      userType: map['userType'] as String,
      eventId: map['eventId'] != null ? map['eventId'] as String : null,
      opportunityModel: OpportunityModel.fromMap(
          map['opportunityModel'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory OpportunityRequest.fromJson(String source) =>
      OpportunityRequest.fromMap(json.decode(source) as Map<String, dynamic>);
}
