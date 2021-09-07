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
          age: 23,
          profileImageUrl:
              'https://firebasestorage.googleapis.com/v0/b/bff-69140.appspot.com/o/talents%2Fimages%2Fm3dV01QH1gos8Rup1NJS.jpg?alt=media&token=fa60e9dd-13ce-49e3-a872-79daab953763'),
      new Talent(
          firstName: 'Juan',
          relevance: 9,
          profession: 'developer',
          age: 43,
          profileImageUrl:
              'https://firebasestorage.googleapis.com/v0/b/bff-69140.appspot.com/o/talents%2Fimages%2FbAcpJr0FrInFNhfzpAIh.jpg?alt=media&token=5213a2a8-5e2c-4bf8-bc23-5afab72707f0'),
      new Talent(
          firstName: 'Luisa',
          lastName: 'Fernanda W',
          relevance: 6,
          profession: 'teacher',
          age: 33,
          profileImageUrl:
              'https://firebasestorage.googleapis.com/v0/b/bff-69140.appspot.com/o/talents%2Fimages%2FGq4mfdJ6gF2vhPjQbbvB.jpg?alt=media&token=57c87e82-89ac-469f-9d0a-fec3e4767e99')
    ];
    return Right(list);
  }
}
