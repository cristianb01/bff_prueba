import 'package:bff_prueba/data/repositories/auth_repository.dart';
import 'package:bff_prueba/data/repositories/talent_repository.dart';
import 'package:bff_prueba/domain/repositories/auth_repository.dart';
import 'package:bff_prueba/domain/repositories/talent_repository.dart';
import 'package:bff_prueba/domain/usecases/get_relevant_talents.dart';
import 'package:bff_prueba/domain/usecases/sign_in.dart';
import 'package:bff_prueba/presentation/cubit/auth/auth_cubit.dart';
import 'package:bff_prueba/presentation/cubit/relevant_talents/relevant_talents_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => RelevantTalentsCubit(sl()));

  sl.registerFactory(() => AuthCubit(sl()));

  sl.registerLazySingleton(() => SignIn(sl()));

  sl.registerLazySingleton(() => GetRelevantTalents(sl()));

  sl.registerLazySingleton<ITalentRepository>(() => TalentRepository());

  sl.registerLazySingleton<IAuthRepository>(() => AuthRepository());

  //sl.registerLazySingleton(() => http.Client());
}
