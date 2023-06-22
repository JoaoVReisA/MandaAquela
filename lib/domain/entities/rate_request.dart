// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RateRequest {
  final String? musicianIdSender;
  final String? musicianContractorIdSender;
  final String? contractorIdSender;
  final String? musicianId;
  final String oportunityId;
  final int stars;
  final String? musicianContractorId;
  final String? contractorId;

  RateRequest({
    this.musicianIdSender,
    this.musicianContractorIdSender,
    this.contractorIdSender,
    this.musicianId,
    required this.oportunityId,
    required this.stars,
    this.musicianContractorId,
    this.contractorId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'musicianIdSender': musicianIdSender,
      'musicianContractorIdSender': musicianContractorIdSender,
      'contractorIdSender': contractorIdSender,
      'musicianId': musicianId,
      'oportunityId': oportunityId,
      'stars': stars,
      'musicianContractorId': musicianContractorId,
      'contractorId': contractorId,
    };
  }

  String toJson() => json.encode(toMap());
}
