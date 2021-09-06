part of 'new_talents_cubit.dart';

abstract class NewTalentsState extends Equatable {
  const NewTalentsState();

  @override
  List<Object> get props => [];
}

class NewtalentsInitial extends NewTalentsState {}

class NewtalentsLoading extends NewTalentsState {}

class NewtalentsLoaded extends NewTalentsState {
  final List<Talent> newTalents;

  NewtalentsLoaded(this.newTalents);

  @override
  List<Object> get props => [newTalents];
}

class NewtalentsError extends NewTalentsState {
  final String message;

  NewtalentsError(this.message);

  @override
  List<Object> get props => [message];
}
