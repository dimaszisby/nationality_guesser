import 'package:flutter/foundation.dart';
import 'dart:async';
import 'dart:convert';

class _Person {
  final String? _name;
  final List<_Country>? _results;

  _Person({this._name, this._results});

  factory _Person.fromJson(Map<String, dynamic> parsedJson) {
    return _Person(
    _name: parsedJson['name'],
    _results: parsedJson['country']
    );
  }
}

class _Country {
  final String? country_id;
  final double? probability;

  _Country({this.country_id, this.probability});

  factory _Country.fromJson(Map<String, dynamic> parsedJson){
    return _Country(
      country_id: parsedJson['country_id'], 
      probability: parsedJson['probability']
    );
  }
}
