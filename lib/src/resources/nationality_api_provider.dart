import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' show Client;

import '../models/person_model.dart';

class NationalityApiProvider {
  Client client = Client();
  final _apiKey = ''; //No API key for this API, to be removed
  final _base_url = "https://api.nationalize.io";
  //String name; //TODO: to be used in the client request

  Future<GuesserModel> fetchResult() async {
    //TODO: Remove when final
    print('Fetching Person on API');

    final response = await client.get("https://api.nationalize.io?name=dimas");
    //TODO: Change here with base URL
    print(response.body.toString());

    if (response.statusCode == 200) {
      //successfull -> parse JSON
      return GuesserModel.fromJson(json.decode(response.body));
    } else {
      //not sucessful -> throw error
      throw Exception('Failed to Fetch Data');
    }
  }
}
