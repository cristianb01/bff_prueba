import 'package:bff_prueba/domain/entities/user.dart';

abstract class AbstractLoginRepository {
  Future<User> login(String userName, String password);

  Future<void> logOut();
}
