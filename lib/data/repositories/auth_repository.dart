import 'package:bff_prueba/core/errors/failure.dart';
import 'package:bff_prueba/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository implements IAuthRepository {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<Either<Failure, dynamic>> signIn(Map userCredentials) async {
    try {
      await auth.signInWithEmailAndPassword(
          email: userCredentials['email'],
          password: userCredentials['password']);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Left(ServerFailure(message: 'User not found'));
      } else if (e.code == 'wrong-password') {
        return Left(ServerFailure(message: 'Wrong password or email'));
      }
    }
    return Right('succesfully logged in');
  }
}
