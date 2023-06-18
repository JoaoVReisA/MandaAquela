import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class SocialMedia {
  SocialMedia({
    required this.link,
    required this.type,
  });
  final String link;
  final String type;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'link': link,
      'type': type,
    };
  }

  factory SocialMedia.fromMap(Map<String, dynamic> map) {
    return SocialMedia(
      link: map['link'] as String,
      type: map['type'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SocialMedia.fromJson(String source) =>
      SocialMedia.fromMap(json.decode(source) as Map<String, dynamic>);
}
