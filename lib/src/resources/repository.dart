import 'dart:async';
import 'nationality_api_provider.dart';
import '../models/person_model.dart';

class Repository {
  final nationalityApiProvider = NationalityApiProvider();

  Future<GuesserModel> fetchPersonNationalities() => nationalityApiProvider.fetchResult();
}
