import 'package:bff_prueba/core/errors/failure.dart';
import 'package:bff_prueba/domain/entities/talent.dart';
import 'package:dartz/dartz.dart';

abstract class ITalentRepository {
  Future<Either<Failure, List<Talent>>> getRelevantTalents();

  Future<Either<Failure, List<Talent>>> getNewTalents();
}
