import 'package:bff_prueba/core/errors/failure.dart';
import 'package:bff_prueba/domain/entities/talent.dart';
import 'package:bff_prueba/domain/repositories/talent_repository.dart';
import 'package:dartz/dartz.dart';

class GetNewTalents {
  final ITalentRepository _talentRepository;

  GetNewTalents(this._talentRepository);

  Future<Either<Failure, List<Talent>>> call() {
    return _talentRepository.getNewTalents();
  }
}
