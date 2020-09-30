
import 'package:mobx/mobx.dart';

import '../models/ountry_cities_response_model.dart';
import '../models/ountry_cities_response_model.dart';
import '../models/ountry_cities_response_model.dart';
import '../network/network_calls_apis.dart';
import '../network/network_services.dart';
import '../utils/config.dart';
part 'create_shop_store.g.dart';

class CreateShopStore = _CreateShopStore with _$CreateShopStore;

abstract class _CreateShopStore with Store {
  NetworkService networkService = new NetworkService();

  @observable
  CountryCitiesResponse citiesResponse;
  @observable
  bool isLoaded = false;
  @observable
  List<Datum> countiresList;
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