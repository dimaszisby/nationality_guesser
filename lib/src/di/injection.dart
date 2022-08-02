import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

import '../blocs/person_bloc.dart';
import '../models/person_model.dart';
import '../resources/nationality_api_provider.dart';
import '../resources/repository.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<NationalityApiProvider>(() => NationalityApiProvider());

  locator.registerLazySingleton<Client>(() => Client());

  locator.registerLazySingleton<Repository>(() => Repository());

  locator.registerLazySingleton<GuesserBloc>(() => GuesserBloc());

  locator.registerLazySingleton<GuesserModel>(() => GuesserModel('', []));//need to be changed later
  
}