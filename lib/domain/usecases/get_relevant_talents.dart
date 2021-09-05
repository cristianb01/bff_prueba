import 'package:bff_prueba/core/errors/failure.dart';
import 'package:bff_prueba/domain/entities/talent.dart';
import 'package:bff_prueba/domain/repositories/talent_repository.dart';
import 'package:dartz/dartz.dart';

class GetRelevantTalents {
  final ITalentRepository _talentRepository;

  GetRelevantTalents(this._talentRepository);

  Future<Either<Failure, List<Talent>>> call() async {
    return _talentRepository.getRelevantTalents();
  }
}
