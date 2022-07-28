import 'dart:async';
import 'nationality_api_provider.dart';
import '../models/person_model.dart';

class Repository {
  //TODO: Current version is not uisng the repo
  final nationalityApiProvider = NationalityApiProvider();

  String nameOnRepo = "";

  String getNameOnRepo(String name) {
    //TODO: To be deleted if not used
    return nameOnRepo;
  }

  set setNameOnRepo(String newName) {
    nameOnRepo = newName;
  }

  Future<GuesserModel> fetchPersonNationalities() =>
      nationalityApiProvider.fetchResult(nameOnRepo);
}
