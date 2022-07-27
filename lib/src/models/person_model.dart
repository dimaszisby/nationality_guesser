import 'dart:convert';
import 'dart:core';

GuesserModel welcomeFromJson(String str) =>
    GuesserModel.fromJson(json.decode(str));

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
