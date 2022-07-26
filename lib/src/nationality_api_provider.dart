import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import './models/person_model.dart';

class NationalityApiProvider {
  Client client = Client();
  final _apiKey = ''; //No API key for this API

  Future<Person> fetchResult() async {
    print('Fetching Person on API');

    final response = await client.get("https://api.nationalize.io?name=michael");
    print(response.body.toString());

    if (response.statusCode == 200) {
      //successfull -> parse JSON
      return Person.fromJson(json.decode(response.body));
    } else {
      //not sucessful -> throw error
      throw Exception('Failed to Fetch Data');
    }
  }

}