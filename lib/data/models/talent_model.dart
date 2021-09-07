import 'dart:convert';

import 'package:bff_prueba/domain/entities/talent.dart';

TalentModel talentModelFromJson(String str, String imageUrl) =>
    TalentModel.fromJson(json.decode(str), imageUrl);

String talentModelToJson(TalentModel data) => json.encode(data.toJson());

class TalentModel extends Talent {
  final int id;
  final String firstName;
  final String lastName;
  final int relevance;
  final int age;
  final String profession;
  final String profileImageUrl;

  TalentModel({
    required this.id,
    required this.profileImageUrl,
    required this.firstName,
    required this.lastName,
    required this.profession,
    required this.relevance,
    required this.age,
  }) : super(
            profileImageUrl: profileImageUrl,
            age: age,
            firstName: firstName,
            profession: profession,
            relevance: relevance,
            id: id,
            lastName: lastName);

  factory TalentModel.fromJson(Map<String, dynamic> json, String imageUrl) =>
      TalentModel(
          age: json['age'],
          firstName: json['firstName'],
          id: json['id'],
          lastName: json['lastName'],
          profession: json['profession'],
          relevance: json['relevance'],
          profileImageUrl: imageUrl);

  Map<String, dynamic> toJson() => {
        'id': id,
        'fistName': firstName,
        'lastName': lastName,
        'relevance': relevance,
        'age': age,
        'profession': profession,
        'profileImageUrl': profileImageUrl
      };
}
