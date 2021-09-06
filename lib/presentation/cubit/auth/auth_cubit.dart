import 'package:bff_prueba/core/errors/failure.dart';
import 'package:bff_prueba/domain/usecases/sign_in.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SignIn signIn;

  AuthCubit(this.signIn) : super(AuthInitial());

  void signInWithEmailAndPassword(Map userCredentials) async {
    emit(AuthLoading());
    final useCaseResponse = await signIn(userCredentials);
    emit(_checkState(useCaseResponse));
  }

  AuthState _checkState(Either<Failure, dynamic> failureOrUser) {
    return failureOrUser.fold(
        (failure) => AuthError(failure.message), (user) => AuthLogged());
  }
}
