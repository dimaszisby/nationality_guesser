import 'dart:async';
import 'nationality_api_provider.dart';
import '../models/person_model.dart';

class Repository {
  final nationalityApiProvider = NationalityApiProvider();
  String nameOnRepo = "";

  String getNameOnRepo(String name) {
    return nameOnRepo;
  }

  set setNameOnRepo(String newName) {
    nameOnRepo = newName;
  }

  Future<GuesserModel> fetchPersonNationalities() =>
      nationalityApiProvider.fetchResult(nameOnRepo);
}
