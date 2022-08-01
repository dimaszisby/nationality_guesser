import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' show Client;

import '../models/person_model.dart';

class NationalityApiProvider {
  Client client = Client();
  final _baseUrl = "https://api.nationalize.io";

  Future<GuesserModel> fetchResult(String nameOnApi) async {
    final response = await client.get("$_baseUrl?name=$nameOnApi");

    if (response.statusCode == 200) {
      return GuesserModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Fetch Data');
    }
  }
}
