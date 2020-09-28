import 'package:dakakini/models/ountry_cities_response_model.dart';
import 'package:dakakini/models/user_shop.dart';
import 'package:dakakini/network/network_calls_apis.dart';
import 'package:dakakini/network/network_services.dart';
import 'package:dakakini/utils/config.dart';
import 'package:mobx/mobx.dart';

part 'get_category_store.g.dart';

class GetShopStore = _GetShopStore with _$GetShopStore;

abstract class _GetShopStore with Store {
  NetworkService networkService = new NetworkService();

  @observable
  UserShop userShopModel;
  @observable
  bool isLoaded = false;

  Future<UserShop> getshopByCatagory(context, categoryId) async {
    userShopModel = await networkService.getshopByCatagory(
        getShopByCategory, context, categoryId);

    return userShopModel;
  }
}
