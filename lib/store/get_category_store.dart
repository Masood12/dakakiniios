import 'package:dakakini/models/ountry_cities_response_model.dart';
import 'package:dakakini/models/user_shop.dart';
import 'package:dakakini/models/submit_review.dart';
import 'package:dakakini/network/network_calls_apis.dart';
import 'package:dakakini/network/network_services.dart';
import 'package:dakakini/utils/config.dart';
import 'package:dakakini/models/add_shop_location_model.dart';
import 'package:flutter/material.dart';
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

  SubmitReview submitReview;
  @observable
  String comments = "";
  @observable
  int ratingValue;
  @observable
  String toID;

  AddShopLocationModel addShopLocationModel;
  @observable
  int shopID;
  @observable
  double lat = 0.0;
  @observable
  double lng = 0.0;
  @observable
  String address;

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

  validateStarScreen(context) {
    if (comments.isEmpty) {
      showToast("Comments can't be empty", true);
      return;
    }
    if (ratingValue == 0) {
      showToast("Please give rating", true);
      return;
    }
    review(context);
  }

  Future<SubmitReview> review(context) async {
    submitReview = await networkService.submitReviewApiCall(
        context, submitReviewApi, toID, ratingValue, comments);
    if (submitReview.status == 0) {
      showToast(submitReview.message, true);
    } else {
      showToast(submitReview.message, false);
    }
    return submitReview;
  }

  validateAddLocationData(context) {
    if (shopID == null) {
      showToast("Shop ID can't be empty", true);
      return;
    }
    if (lat == 0.0 || lng == 0.0) {
      showToast("Latitute Longitude can't be empty", true);
      return;
    }
    if (address.isEmpty) {
      showToast("Address can't be empty", true);
      return;
    }
    addShopLocation(context);
  }

  Future<AddShopLocationModel> addShopLocation(context) async {
    addShopLocationModel = await networkService.addShopLocationApiCall(
        context, addShopLocationApi, shopID, lat, lng, address);
    if (addShopLocationModel.status == 0) {
      showToast(addShopLocationModel.message, true);
    } else {
      Navigator.pop(context);
      showToast(addShopLocationModel.message, false);
    }
    return addShopLocationModel;
  }
}
