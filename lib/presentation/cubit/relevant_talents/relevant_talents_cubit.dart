import 'package:bff_prueba/core/errors/failure.dart';
import 'package:bff_prueba/domain/entities/talent.dart';
import 'package:bff_prueba/domain/usecases/get_relevant_talents.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'relevant_talents_state.dart';

class RelevantTalentsCubit extends Cubit<RelevantTalentsState> {
  final GetRelevantTalents getRelevantTalents;

  RelevantTalentsCubit(this.getRelevantTalents)
      : super(RelevantTalentsInitial());

  void getAllRelevantTalents() async {
    emit(RelevantTalentsLoading());
    final useCaseResponse = await getRelevantTalents();
    emit(_checkState(useCaseResponse));
  }

  RelevantTalentsState _checkState(
      Either<Failure, List<Talent>> failureOrTalents) {
    return failureOrTalents.fold(
        (failure) => RelevantTalentsError(_mapFailureToMessage(failure)),
        (talents) => RelevantTalentsLoaded(talents));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return failure.message;
      default:
        return 'Unexpected error';
    }
  }
}
