import 'package:flutter/foundation.dart';
import 'dart:async';
import 'dart:convert';

class Person {
  final String name;
  final List<Country> countries;

  Person({
    required this.name,
    required this.countries,
  });

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
}

class Country {
  final String country_id;
  final double probability;

  Country({
    required this.country_id,
    required this.probability,
  });

  factory Country.fromJson(Map<String, dynamic> parsedJson) {
    final country_id = parsedJson['country_id'] as String;
    final probability = parsedJson['probability'] as double;

    return Country(country_id: country_id, probability: probability);
  }

  Map<String, dynamic> toJson() {
    return {'country_id': country_id, 'probability': probability};
  }
}

//TODO: Delete this when are not needed
class DummyPerson {
  final String dummyName;
  final String dummyCountry;
  final double dummyProbability;

  DummyPerson(this.dummyName, this.dummyCountry, this.dummyProbability);
}
