import 'package:bff_prueba/core/errors/failure.dart';
import 'package:bff_prueba/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class SignIn {
  final IAuthRepository _authRepository;

  SignIn(this._authRepository);

  Future<Either<Failure, dynamic>> call(String email, String password) async {
    return _authRepository.signIn(email, password);
  }
}
