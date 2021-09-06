import 'dart:convert';

import 'package:bff_prueba/domain/entities/talent.dart';
import 'package:bff_prueba/core/errors/failure.dart';
import 'package:bff_prueba/domain/repositories/talent_repository.dart';
import 'package:bff_prueba/environment.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class FakeRepository implements ITalentRepository {
  final String? firebaseFunctionsUrl = env['FB_FUNCTIONS_URL'];

  @override
  Future<Either<Failure, List<Talent>>> getNewTalents() async {
    Uri talenstEndpointUri = Uri.parse('$firebaseFunctionsUrl/talents/news');
    Response response = await http.get(talenstEndpointUri);

    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);
      return Right(new List.empty()); // this has to be changed!
    } else {
      return Left(ServerFailure(
          message: 'An error ocurred when trying to request the server'));
    }
  }

  @override
  Future<Either<Failure, List<Talent>>> getRelevantTalents() async {
    var list = [
      new Talent(
          firstName: 'Cristian',
          relevance: 8,
          profession: 'developer',
          age: 23),
      new Talent(
          firstName: 'Juan', relevance: 9, profession: 'developer', age: 43),
      new Talent(
          firstName: 'Edwin', relevance: 6, profession: 'teacher', age: 33)
    ];
    return Right(list);
  }
}
