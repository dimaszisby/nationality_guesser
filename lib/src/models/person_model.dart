import 'package:flutter/foundation.dart';
import 'dart:async';
import 'dart:convert';

//NOTE: Experiments on Data Model when error

String newsModelToJson(Person data) => json.encode(data.toJson());

class Person {
  final String name;
  final List<Country> countries;

  Person({
    required this.name,
    required this.countries,
  });

  //version 1 -> cant run on the UI StreamBuilder because of Data Type
  /*
  factory Person.fromJson(Map<String, dynamic> parsedJson) {
    final name = parsedJson['name'] as String;
    final countriesData = parsedJson['country'] as List<dynamic>;
    final countries = countriesData
        .map((countryData) => Country.fromJson(countryData))
        .toList();

    return Person(
      name: name,
      countries: countries,
    );
  }
*/

  //version 2
  factory Person.fromJson(Map<String, dynamic> json) => Person(
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
  final String country_id;
  final double probability;

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

//TODO: Delete this when are not needed
class DummyPerson {
  final String dummyName;
  final String dummyCountry;
  final double dummyProbability;

  DummyPerson(this.dummyName, this.dummyCountry, this.dummyProbability);
}
