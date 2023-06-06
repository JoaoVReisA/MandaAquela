// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.isMusician,
    required this.isContractor,
    required this.isSignUpCompleted,
  });

  final String id;
  final String name;
  final String email;
  final bool isMusician;
  final bool isContractor;
  final bool isSignUpCompleted;

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    bool? isMusician,
    bool? isContractor,
    bool? isSignUpCompleted,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      isMusician: isMusician ?? this.isMusician,
      isContractor: isContractor ?? this.isContractor,
      isSignUpCompleted: isSignUpCompleted ?? this.isSignUpCompleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'isMusician': isMusician,
      'isContractor': isContractor,
      'isSignUpCompleted': isSignUpCompleted,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      isMusician: map['isMusician'] as bool,
      isContractor: map['isContractor'] as bool,
      isSignUpCompleted: map['isSignUpCompleted'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
