
import 'dart:js';

import 'package:mobx/mobx.dart';

import '../models/ountry_cities_response_model.dart';
import '../models/ountry_cities_response_model.dart';
import '../models/ountry_cities_response_model.dart';
import '../models/upload_image_model.dart';
import '../network/network_calls_apis.dart';
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
  UploadImageModel uploadImageModel;
  @observable
  bool isLoaded = false;
  @observable
  List<Datum> countiresList;
  @observable
  int cityId;
  @observable
  int countryId;
  @observable
  int catId;
  @observable
  int userId;
  @observable
  String shopName = "";
  @observable
  String shopSubtitle = "";
  @observable
  String description = "";
  @observable
  String featureImage = "";
  @observable
  String imagebase64 = "";
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

  base64Validation(){
    if(imagebase64.isEmpty){
      showToast("Select Shop image to continue", true);
    }
    uploadImageToServer(context);
  }
  Future<UploadImageModel> uploadImageToServer(context) async {
    uploadImageModel = await networkService.uploadImageApiCall(
        imageUpload, context,imagebase64);
    if (uploadImageModel.status == 0) {
      isLoaded = false;
      showToast(uploadImageModel.message, true);
    } else {
      isLoaded = true;
      validateData();
    }
    return uploadImageModel;
  }

  validateData(){
    if(shopName.isEmpty){
      showToast("Shop Name cannot be empty", true);
    }
    if(shopSubtitle.isEmpty){
      showToast("Shop subtitle cannot be empty", true);
    }
    if(catId==null){
      showToast("Select Shop Catageory", true);
    }
    if(countryId==null){
      showToast("Select Shop Country", true);
    }
    if(cityId==null){
      showToast("Select Shop City", true);
    }
    if(description.isEmpty){
      showToast("Add Shop description", true);
    }

    createShop();
  }

  createShop(){

  }


}