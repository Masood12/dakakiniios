import 'package:dakakini/models/base_response_model.dart';
import 'package:dakakini/utils/loaders/progress_dialog.dart';
import 'package:flutter/src/widgets/framework.dart';
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
  BaseResponseModel baseResponseModel;
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
  var baseUrlImage = "http://application.dakakini.com/uploads/";

  Future<CountryCitiesResponse> citiesCountries(context) async {
    citiesResponse =
        await networkService.getCitiesAndCountries(countryApi, context);
    if (citiesResponse.status == 0) {
      isLoaded = false;
      showToast(citiesResponse.message, true);
    } else {
      isLoaded = true;
      return citiesResponse;
    }
    return citiesResponse;
  }

  uploadImageToServer(context) async {
    ProgressDialogDotted().showProgressDialog(context);

    uploadImageModel = await networkService.uploadImageApiCall(context,
        imageUpload,imagebase64);
    if (uploadImageModel.status == 0) {
      isLoaded = false;
      ProgressDialogDotted().hideProgressDialog(context);

      showToast(uploadImageModel.message, true);
    } else {
      isLoaded = true;
      createShop(context, "$baseUrlImage${uploadImageModel.data}");
    }
  }

  validateData(context){
    if(imagebase64==null){
      showToast("Please select valid image", true);
    }
    if(shopName.isEmpty){
      showToast("Shop Name cannot be empty", true);
    }
    if (shopSubtitle.isEmpty) {
      showToast("Shop subtitle cannot be empty", true);
    }
    if (catId == null) {
      showToast("Select Shop Catageory", true);
    }
    if (countryId == null) {
      showToast("Select Shop Country", true);
    }
    if (cityId == null) {
      showToast("Select Shop City", true);
    }
    if (description.isEmpty) {
      showToast("Add Shop description", true);
    }
    uploadImageToServer(context);

  }

  Future<BaseResponseModel> createShop(context, photoUrl) async {
    baseResponseModel = await networkService.createShopApiCall(context,
        createShop, shopName, shopSubtitle, description, photoUrl,catId,cityId, countryId);
    ProgressDialogDotted().hideProgressDialog(context);
    if (baseResponseModel.status == 0) {
      showToast(baseResponseModel.message, true);
    } else {
      showToast(baseResponseModel.message, false);
    }
    return baseResponseModel;
  }

}
