part of 'relevant_talents_cubit.dart';

abstract class RelevantTalentsState extends Equatable {
  const RelevantTalentsState();

  @override
  List<Object> get props => [];
}

class RelevantTalentsInitial extends RelevantTalentsState {}

class RelevantTalentsLoading extends RelevantTalentsState {}

class RelevantTalentsLoaded extends RelevantTalentsState {
  final List<Talent> talents;

  RelevantTalentsLoaded(this.talents);

  @override
  List<Object> get props => [talents];
}

class RelevantTalentsError extends RelevantTalentsState {
  final String message;

  RelevantTalentsError(this.message);

  @override
  List<Object> get props => [message];
}
