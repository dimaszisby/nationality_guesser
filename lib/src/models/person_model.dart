import 'dart:convert';
import 'dart:core';

/*

//NOTE: Experiments on Data Model when error
GuesserModel newsModelFromJson(String str) => GuesserModel.fromJson(json.decode(str));
String newsModelToJson(GuesserModel data) => json.encode(data.toJson());

class GuesserModel {
  String name;
  List<Country> countries;

  GuesserModel({
    required this.name,
    required this.countries,
  });

  //version 1 -> cant run on the UI StreamBuilder because of Data Type
  /*
  factory GuesserModel.fromJson(Map<String, dynamic> parsedJson) {
    final name = parsedJson['name'] as String;
    final countriesData = parsedJson['country'] as List<dynamic>;
    final countries = countriesData
        .map((countryData) => Country.fromJson(countryData))
        .toList();

    return GuesserModel(
      name: name,
      countries: countries,
    );
  }
*/

  //version 2
  factory GuesserModel.fromJson(Map<String, dynamic> json) => GuesserModel(
        name: json["name"],
        countries:
            List<Country>.from(json["country"].map((x) => Country.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "country": List<dynamic>.from(countries.map((x) => x.toJson())),
      };
}

class Country {
  String country_id;
  double probability;

  Country({
    required this.country_id,
    required this.probability,
  });

  //Version 1 --> cant be used on Stream Builder
  /*
  factory Country.fromJson(Map<String, dynamic> parsedJson) {
    final country_id = parsedJson['country_id'] as String;
    final probability = parsedJson['probability'] as double;

    return Country(country_id: country_id, probability: probability);
  }

  Map<String, dynamic> toJson() {
    return {'country_id': country_id, 'probability': probability};
  }
*/

  //version 2
  factory Country.fromJson(Map<String, dynamic> json) => Country(
        country_id: json["country_id"],
        probability: json["probability"],
      );

  Map<String, dynamic> toJson() => {
        "country_id": country_id,
        "probability": probability,
      };
}

// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }

//TODO: Delete this when are not needed
class DummyPerson {
  final String dummyName;
  final String dummyCountry;
  final double dummyProbability;

  DummyPerson(this.dummyName, this.dummyCountry, this.dummyProbability);
}

*/

GuesserModel welcomeFromJson(String str) => GuesserModel.fromJson(json.decode(str));

String welcomeToJson(GuesserModel data) => json.encode(data.toJson());

class GuesserModel {
  String name = '';
  List<Country> country = [];

  GuesserModel(this.name, this.country);

  GuesserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['country'] != null) {
      country = <Country>[];
      json['country'].forEach((v) {
        country.add(new Country.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.country != null) {
      data['country'] = this.country.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Country {
  String countryId = '';
  double probability = 0.0;

  Country(this.countryId, this.probability);

  Country.fromJson(Map<String, dynamic> json) {
    countryId = json['country_id'];
    probability = json['probability'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country_id'] = this.countryId;
    data['probability'] = this.probability;
    return data;
  }
}

