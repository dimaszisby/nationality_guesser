import 'dart:async';
import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:nationality_guesser_app/src/ui/component/page/nationality_result_list.dart';

import '../models/person_model.dart';

class NationalityApiProvider {
  Client client = Client();
  final _base_url = "https://api.nationalize.io";
  late String _nameOnApi = '';

  String get getNameOnApi {
    //TODO: To be deleted later if not used
    return _nameOnApi;
  }

  set setNameOnApi(String newName) {
    _nameOnApi = newName;
  }

  Future<GuesserModel> fetchResult(String nameOnApi) async {
    final response = await client.get("$_base_url?name=$nameOnApi");
    print(response.body.toString());

    if (response.statusCode == 200) {
      return GuesserModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to Fetch Data');
    }
  }
}
