import 'dart:convert';

import 'package:bff_prueba/domain/entities/talent.dart';

TalentModel talentModelFromJson(String str) =>
    TalentModel.fromJson(json.decode(str));

String talentModelToJson(TalentModel data) => json.encode(data.toJson());

class TalentModel extends Talent {
  final int id;
  final String firstName;
  final String lastName;
  final int relevance;
  final int age;
  final String profession;

  TalentModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.profession,
    required this.relevance,
    required this.age,
  }) : super(
            age: age,
            firstName: firstName,
            profession: profession,
            relevance: relevance,
            id: id,
            lastName: lastName);

  factory TalentModel.fromJson(Map<String, dynamic> json) => TalentModel(
      age: json['age'],
      firstName: json['firstName'],
      id: json['id'],
      lastName: json['lastName'],
      profession: json['profession'],
      relevance: json['relevance']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'fistName': firstName,
        'lastName': lastName,
        'relevance': relevance,
        'age': age,
        'profession': profession
      };
}
