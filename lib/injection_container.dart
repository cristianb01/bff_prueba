import 'package:bff_prueba/data/repositories/fake_repository.dart';
import 'package:bff_prueba/data/repositories/talent_repository.dart';
import 'package:bff_prueba/domain/repositories/talent_repository.dart';
import 'package:bff_prueba/domain/usecases/get_relevant_talents.dart';
import 'package:bff_prueba/presentation/cubit/relevant_talents/relevant_talents_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => RelevantTalentsCubit(sl()));

  sl.registerLazySingleton(() => GetRelevantTalents(sl()));

  //sl.registerLazySingleton<ITalentRepository>(() => TalentRepository());
  sl.registerLazySingleton<ITalentRepository>(() => FakeRepository());

  //sl.registerLazySingleton(() => http.Client());
}
