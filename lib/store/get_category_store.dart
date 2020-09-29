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
  UserShop userFoodShopModel;
  @observable
  UserShop userClothShopModel;
  @observable
  UserShop userBakhoorShopModel;
  @observable
  bool isLoaded = false;
  @observable
  bool isFoodListLoaded = false;
  @observable
  bool isClothListLoaded = false;
  @observable
  bool isBakhoorListLoaded = false;

  Future<UserShop> getshopByCatagory(context, categoryId) async {
    if (categoryId == 1) {
      userFoodShopModel = await networkService.getshopByCatagory(
          getShopByCategory, context, categoryId);
      if (userFoodShopModel.status == 1) {
        isFoodListLoaded = true;
      } else {
        isFoodListLoaded = false;
      }
      return userFoodShopModel;
    }

    if (categoryId == 2) {
      userClothShopModel = await networkService.getshopByCatagory(
          getShopByCategory, context, categoryId);
      if (userClothShopModel.status == 1) {
        isClothListLoaded = true;
      } else {
        isClothListLoaded = false;
      }
      return userClothShopModel;
    }

    if (categoryId == 3) {
      userBakhoorShopModel = await networkService.getshopByCatagory(
          getShopByCategory, context, categoryId);
      if (userBakhoorShopModel.status == 1) {
        isBakhoorListLoaded = true;
      } else {
        isBakhoorListLoaded = false;
      }
      return userBakhoorShopModel;
    }
  }
}
