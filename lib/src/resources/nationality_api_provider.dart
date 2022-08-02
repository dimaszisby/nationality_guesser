import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:nationality_guesser_app/src/di/injection.dart';

import '../models/person_model.dart';

class NationalityApiProvider {
  final client = locator<Client>();
  final _baseUrl = "https://api.nationalize.io";

  Future<GuesserModel> fetchResult(String nameOnApi) async {
    final response = await client.get(Uri.parse("$_baseUrl?name=$nameOnApi"));

    if (response.statusCode == 200) {
      return GuesserModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Fetch Data');
    }
  }
}
