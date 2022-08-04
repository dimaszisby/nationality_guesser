import 'dart:convert';
import 'dart:core';

GuesserModel welcomeFromJson(String str) =>
    GuesserModel.fromJson(json.decode(str));

String welcomeToJson(GuesserModel data) => json.encode(data.toJson());

class GuesserModel {
 late  String name;
  late List<Country> country;

  GuesserModel(this.name, this.country);

  GuesserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['country'] != null) {
      country = <Country>[];
      json['country'].forEach((v) {
        country.add(Country.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (country.isEmpty) {
      data['country'] = country.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Country {
  late String countryId;
  late double probability;

  Country(this.countryId, this.probability);

  Country.fromJson(Map<String, dynamic> json) {
    countryId = json['country_id'];
    probability = json['probability'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country_id'] = countryId;
    data['probability'] = probability;
    return data;
  }
}
