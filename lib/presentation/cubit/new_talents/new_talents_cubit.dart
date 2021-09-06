import 'dart:html';

import 'package:bff_prueba/core/errors/failure.dart';
import 'package:bff_prueba/domain/entities/talent.dart';
import 'package:bff_prueba/domain/usecases/get_new_talents.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'new_talents_state.dart';

class NewTalentsCubit extends Cubit<NewTalentsState> {
  final GetNewTalents getNewTalents;

  NewTalentsCubit(this.getNewTalents) : super(NewtalentsInitial());

  void getAllNewTalents() async {
    emit(NewtalentsLoading());
    final useCaseResponse = await getNewTalents();
    emit(_checkState(useCaseResponse));
  }

  NewTalentsState _checkState(Either<Failure, List<Talent>> failureOrTalents) {
    return failureOrTalents.fold(
        (failure) => NewtalentsError(_mapFailureToState(failure)),
        (talents) => NewtalentsLoaded(talents));
  }

  String _mapFailureToState(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return failure.message;
      default:
        return 'Unexpected error';
    }
  }
}
