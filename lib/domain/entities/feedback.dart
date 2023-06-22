// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FeedbackEntity {
  final String id;
  final int stars;

  FeedbackEntity({
    required this.id,
    required this.stars,
  });

  factory FeedbackEntity.fromMap(Map<String, dynamic> map) {
    return FeedbackEntity(
      id: map['id'] as String,
      stars: map['stars'] as int,
    );
  }

  factory FeedbackEntity.fromJson(String source) =>
      FeedbackEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}
