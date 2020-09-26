import 'dart:convert';

import 'package:dakakini/models/login_response_model.dart';
import 'package:dakakini/models/ountry_cities_response_model.dart';
import 'package:dakakini/network/network_calls_apis.dart';
import 'package:dakakini/network/network_services.dart';
import 'package:dakakini/ui/HomeScreen.dart';
import 'package:dakakini/utils/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';


class HomeScreenStore = _HomeScreenStore with _$HomeScreenStore;

abstract class _HomeScreenStore with Store {
  NetworkService networkService = new NetworkService();

  @observable
  CountryCitiesResponse citiesResponse;
  @observable
  bool isLoaded = false;

  Future<CountryCitiesResponse> citiesCountries(context) async {
    citiesResponse = await networkService.getCitiesAndCountries(
        countryApi, context);
    if (citiesResponse.status == 0) {
      isLoaded = false;
      showToast(citiesResponse.message, true);
    } else {
      isLoaded = true;

      return citiesResponse;
    }
    return citiesResponse;
  }



}


