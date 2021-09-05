import 'package:equatable/equatable.dart';

class Talent extends Equatable {
  final dynamic id;
  final String firstName;
  final String? lastName;
  final String profession;
  final int relevance;
  final int age;

  Talent(
      {this.id,
      required this.firstName,
      this.lastName,
      required this.relevance,
      required this.profession,
      required this.age});

  @override
  List<Object?> get props => [
        id,
        firstName,
        profession,
        relevance,
        age,
      ];
}
