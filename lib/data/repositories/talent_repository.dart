import 'dart:convert';
import 'dart:io';

import 'package:bff_prueba/core/errors/exceptions.dart';
import 'package:bff_prueba/data/models/talent_model.dart';
import 'package:bff_prueba/domain/entities/talent.dart';
import 'package:bff_prueba/core/errors/failure.dart';
import 'package:bff_prueba/domain/repositories/talent_repository.dart';
import 'package:bff_prueba/environment.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class TalentRepository implements ITalentRepository {
  final String? firebaseFunctionsUrl = env['FB_FUNCTIONS_URL'];

  @override
  Future<Either<Failure, List<Talent>>> getNewTalents() async {
    Uri talenstEndpointUri = Uri.parse('$firebaseFunctionsUrl/talents/news');
    Response response = await http.get(talenstEndpointUri);

    if (response.statusCode == 200) {
      Iterable responseBody = jsonDecode(response.body);

      List<TalentModel> list = List<TalentModel>.from(
          responseBody.map((model) => talentModelFromJson(model)));

      return Right(list);
    } else {
      return Left(ServerFailure(
          message: 'An error ocurred when trying to request the server'));
    }
  }

  @override
  Future<Either<Failure, List<Talent>>> getRelevantTalents() async {
    Uri talentsEndpointUri =
        Uri.parse('$firebaseFunctionsUrl/talents/relevant');
    Response response = await http.get(talentsEndpointUri);

    if (response.statusCode == 200) {
      Iterable responseBody = jsonDecode(response.body);

      List<Talent> list = List<TalentModel>.from(
          responseBody.map((model) => talentModelFromJson(model)));

      return Right(list);
    } else {
      return Left(ServerFailure(
          message: 'An error ocurred when trying to request the server'));
    }
  }
}
