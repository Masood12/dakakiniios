// To parse this JSON data, do
//
//     final countryCitiesResponse = countryCitiesResponseFromJson(jsonString);

import 'dart:convert';

CountryCitiesResponse countryCitiesResponseFromJson(String str) => CountryCitiesResponse.fromJson(json.decode(str));

String countryCitiesResponseToJson(CountryCitiesResponse data) => json.encode(data.toJson());

class CountryCitiesResponse {
  CountryCitiesResponse({
    this.data,
    this.status,
    this.message,
  });

  List<Datum> data;
  int status;
  String message;

  factory CountryCitiesResponse.fromJson(Map<String, dynamic> json) => CountryCitiesResponse(
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : List<dynamic>.from(data.map((x) => x.toJson())),
    "status": status == null ? null : status,
    "message": message == null ? null : message,
  };
}

class Datum {
  Datum({
    this.cities,
    this.countryId,
    this.name,
    this.flage,
    this.isdeleted,
  });

  List<City> cities;
  int countryId;
  String name;
  String flage;
  dynamic isdeleted;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    cities: json["cities"] == null ? null : List<City>.from(json["cities"].map((x) => City.fromJson(x))),
    countryId: json["country_id"] == null ? null : json["country_id"],
    name: json["name"] == null ? null : json["name"],
    flage: json["flage"] == null ? null : json["flage"],
    isdeleted: json["isdeleted"],
  );

  Map<String, dynamic> toJson() => {
    "cities": cities == null ? null : List<dynamic>.from(cities.map((x) => x.toJson())),
    "country_id": countryId == null ? null : countryId,
    "name": name == null ? null : name,
    "flage": flage == null ? null : flage,
    "isdeleted": isdeleted,
  };
}

class City {
  City({
    this.cityId,
    this.cityName,
    this.cityFlag,
    this.isdeleted,
  });

  int cityId;
  String cityName;
  String cityFlag;
  dynamic isdeleted;

  factory City.fromJson(Map<String, dynamic> json) => City(
    cityId: json["city_id"] == null ? null : json["city_id"],
    cityName: json["city_name"] == null ? null : json["city_name"],
    cityFlag: json["city_flag"] == null ? null : json["city_flag"],
    isdeleted: json["isdeleted"],
  );

  Map<String, dynamic> toJson() => {
    "city_id": cityId == null ? null : cityId,
    "city_name": cityName == null ? null : cityName,
    "city_flag": cityFlag == null ? null : cityFlag,
    "isdeleted": isdeleted,
  };
}
