import 'dart:convert';
import 'dart:io';
import 'package:dakakini/models/base_response_model.dart';
import 'package:dakakini/models/login_response_model.dart';
import 'package:dakakini/models/ountry_cities_response_model.dart';
import 'package:dakakini/models/sign_model.dart';
import 'package:dakakini/models/submit_review.dart';
import 'package:dakakini/models/upload_image_model.dart';
import 'package:dakakini/models/user_shop.dart';
import 'package:dakakini/models/create_shop_menu_model.dart';
import 'package:dakakini/models/add_shop_photo_model.dart';
import 'package:dakakini/models/add_shop_location_model.dart';
import 'package:dakakini/utils/config.dart';
import 'package:dakakini/utils/loaders/progress_dialog.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class NetworkService {
  LoginResponseModel authModel = new LoginResponseModel();
  SignUp signUpModel = new SignUp();
  UserShop userShopModel = new UserShop();
  CountryCitiesResponse countryCitiesResponse = CountryCitiesResponse();
  BaseResponseModel baseResponseModel = BaseResponseModel();
  SubmitReview submitReview = SubmitReview();
  /* Network Api Calls */
  UploadImageModel uploadImageModel = UploadImageModel();
  AddShopLocationModel addShopLocationModel = AddShopLocationModel();
  AddShopPhoto addShopPhoto = AddShopPhoto();
  CreateShopMenu createShopMenu = CreateShopMenu();

  checkIfInternetIsAvailable() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
  }

  Future<LoginResponseModel> outhUser(url, email, password, context) async {
    ProgressDialogDotted().showProgressDialog(context);

    var body = {
      "email": "$email",
      "pass": "$password",
    };
    print("$body");
    var headers = {"Content-Type": "application/x-www-form-urlencoded"};
    try {
      final response = await http.post(url, headers: headers, body: body);
      final int statusCode = response.statusCode;
      print('status code :: ${statusCode}');
      var decodedResponse = json.decode(response.body);
      ProgressDialogDotted().hideProgressDialog(context);
      if (statusCode >= 200 && statusCode <= 299) {
        return LoginResponseModel.fromJson(decodedResponse);
      } else if ((statusCode >= 100 && statusCode <= 199) ||
          (statusCode >= 300 && statusCode <= 499) ||
          json == null) {
        authModel.status = 1;
        authModel.message = decodedResponse['messages'];
        return Future.value(authModel);
      } else if (statusCode >= 500 && statusCode <= 599) {
        authModel.status = 0;
        authModel.message = 'Internal Server Error';
        return Future.value(authModel);
      }
    } on Exception catch (e) {
      ProgressDialogDotted().hideProgressDialog(context);
      authModel.status = 0;
      if (e.toString().contains("SocketException"))
        authModel.message = 'Internet Not Connected';
      else
        authModel.message = '' + technicalErrorMessage;
      return Future.value(authModel);
    }
  }

  Future<SignUp> signUpUser(
      url, fullName, email, password, userType, refNo, context) async {
    ProgressDialogDotted().showProgressDialog(context);

    var body = {
      "name": '$fullName',
      "email": "$email",
      "pass": "$password",
      "user_type": "$userType",
      "ref_no": "$refNo",
    };
    print("$body");
    var headers = {"Content-Type": "application/x-www-form-urlencoded"};
    try {
      final response = await http.post(
        url,
        body: body,
        headers: headers,
      );
      final int statusCode = response.statusCode;
      print(statusCode);
      var decodedResponse = json.decode(response.body);
      ProgressDialogDotted().hideProgressDialog(context);
      if (statusCode >= 200 && statusCode <= 299) {
        return SignUp.fromJson(decodedResponse);
      } else if ((statusCode >= 100 && statusCode <= 199) ||
          (statusCode >= 300 && statusCode <= 499) ||
          json == null) {
        signUpModel.status = 1;
        signUpModel.message = decodedResponse['messages'];
        return Future.value(signUpModel);
      } else if (statusCode >= 500 && statusCode <= 599) {
        signUpModel.status = 0;
        signUpModel.message = 'Internal Server Error';
        return Future.value(signUpModel);
      }
    } on Exception catch (e) {
      ProgressDialogDotted().hideProgressDialog(context);
      signUpModel.status = 0;
      if (e.toString().contains("SocketException"))
        signUpModel.message = 'Internet Not Connected';
      else
        signUpModel.message = '' + technicalErrorMessage;
      return Future.value(signUpModel);
    }
  }

  Future<CountryCitiesResponse> getCitiesAndCountries(url, context) async {
    ProgressDialogDotted().showProgressDialog(context);
    try {
      final response = await http.get(url);
      final int statusCode = response.statusCode;
      var decodedResponse = json.decode(response.body);
      print("$url \n $decodedResponse");
      ProgressDialogDotted().hideProgressDialog(context);
      print(decodedResponse);
      if (statusCode >= 200 && statusCode <= 299) {
        return CountryCitiesResponse.fromJson(decodedResponse);
      } else if ((statusCode >= 100 && statusCode <= 199) ||
          (statusCode >= 300 && statusCode <= 499) ||
          json == null) {
        countryCitiesResponse.status = 0;
        countryCitiesResponse.message = decodedResponse['messages'];
        return Future.value(countryCitiesResponse);
      } else if (statusCode >= 500 && statusCode <= 599) {
        countryCitiesResponse.status = 0;
        countryCitiesResponse.message = 'Internal Server Error';
        return Future.value(countryCitiesResponse);
      }
    } on Exception catch (e) {
      ProgressDialogDotted().hideProgressDialog(context);
      countryCitiesResponse.status = 0;
      if (e.toString().contains("SocketException"))
        countryCitiesResponse.message = 'Internet Not Connected';
      else
        countryCitiesResponse.message = '' + technicalErrorMessage;
      return Future.value(countryCitiesResponse);
    }
  }

  Future<UserShop> getshopByCatagory(url, context, id) async {
    ProgressDialogDotted().showProgressDialog(context);
    url = url + "id=$id&userid=0";
    try {
      final response = await http.get(url);
      final int statusCode = response.statusCode;
      var decodedResponse = json.decode(response.body);
      print("$url \n $decodedResponse");
      ProgressDialogDotted().hideProgressDialog(context);
      print(decodedResponse);
      if (statusCode >= 200 && statusCode <= 299) {
        return UserShop.fromJson(decodedResponse);
      } else if ((statusCode >= 100 && statusCode <= 199) ||
          (statusCode >= 300 && statusCode <= 499) ||
          json == null) {
        userShopModel.status = 0;
        userShopModel.message = decodedResponse['messages'];
        return Future.value(userShopModel);
      } else if (statusCode >= 500 && statusCode <= 599) {
        userShopModel.status = 0;
        userShopModel.message = 'Internal Server Error';
        return Future.value(userShopModel);
      }
    } on Exception catch (e) {
      ProgressDialogDotted().hideProgressDialog(context);
      userShopModel.status = 0;
      if (e.toString().contains("SocketException"))
        userShopModel.message = 'Internet Not Connected';
      else
        userShopModel.message = '' + technicalErrorMessage;
      return Future.value(userShopModel);
    }
  }

  Future<BaseResponseModel> forgetPassword(url, email, context) async {
    ProgressDialogDotted().showProgressDialog(context);

    url = url + "email=$email";
    print(url);
    var headers = {"Content-Type": "application/x-www-form-urlencoded"};
    try {
      final response = await http.get(url);
      final int statusCode = response.statusCode;
      print(statusCode);
      var decodedResponse = json.decode(response.body);
      ProgressDialogDotted().hideProgressDialog(context);
      if (statusCode >= 200 && statusCode <= 299) {
        return BaseResponseModel.fromJson(decodedResponse);
      } else if ((statusCode >= 100 && statusCode <= 199) ||
          (statusCode >= 300 && statusCode <= 499) ||
          json == null) {
        baseResponseModel.status = 1;
        baseResponseModel.message = decodedResponse['messages'];
        return Future.value(baseResponseModel);
      } else if (statusCode >= 500 && statusCode <= 599) {
        baseResponseModel.status = 0;
        baseResponseModel.message = 'Internal Server Error';
        return Future.value(baseResponseModel);
      }
    } on Exception catch (e) {
      ProgressDialogDotted().hideProgressDialog(context);
      baseResponseModel.status = 0;
      if (e.toString().contains("SocketException"))
        baseResponseModel.message = 'Internet Not Connected';
      else
        baseResponseModel.message = '' + technicalErrorMessage;
      return Future.value(baseResponseModel);
    }
  }

  Future<BaseResponseModel> changePassword(
      url, oldPassword, newPassword, userId, context) async {
    ProgressDialogDotted().showProgressDialog(context);

    var body = {
      "oldpass": '$oldPassword',
      "newpass": "$newPassword",
      "userId": "$userId",
    };
    print("$body");
    var headers = {"Content-Type": "application/x-www-form-urlencoded"};
    try {
      final response = await http.post(
        url,
        body: body,
        headers: headers,
      );
      final int statusCode = response.statusCode;
      print(statusCode);
      var decodedResponse = json.decode(response.body);
      ProgressDialogDotted().hideProgressDialog(context);
      if (statusCode >= 200 && statusCode <= 299) {
        return BaseResponseModel.fromJson(decodedResponse);
      } else if ((statusCode >= 100 && statusCode <= 199) ||
          (statusCode >= 300 && statusCode <= 499) ||
          json == null) {
        baseResponseModel.status = 1;
        baseResponseModel.message = decodedResponse['messages'];
        return Future.value(baseResponseModel);
      } else if (statusCode >= 500 && statusCode <= 599) {
        baseResponseModel.status = 0;
        baseResponseModel.message = 'Internal Server Error';
        return Future.value(baseResponseModel);
      }
    } on Exception catch (e) {
      ProgressDialogDotted().hideProgressDialog(context);
      baseResponseModel.status = 0;
      if (e.toString().contains("SocketException"))
        baseResponseModel.message = 'Internet Not Connected';
      else
        baseResponseModel.message = '' + technicalErrorMessage;
      return Future.value(baseResponseModel);
    }
  }

  Future<SubmitReview> submitReviewApiCall(
      context, url, toId, value, comments) async {
    ProgressDialogDotted().showProgressDialog(context);
    var userID = await Config.getUserID();
    var body = {
      "by_id": '$userID',
      "toid": "$toId",
      "value": "$value",
      "comments": "$comments",
    };
    print("$body");
    var headers = {"Content-Type": "application/x-www-form-urlencoded"};
    try {
      final response = await http.post(
        url,
        body: body,
        headers: headers,
      );
      final int statusCode = response.statusCode;
      print(statusCode);
      var decodedResponse = json.decode(response.body);
      ProgressDialogDotted().hideProgressDialog(context);
      if (statusCode >= 200 && statusCode <= 299) {
        return SubmitReview.fromJson(decodedResponse);
      } else if ((statusCode >= 100 && statusCode <= 199) ||
          (statusCode >= 300 && statusCode <= 499) ||
          json == null) {
        submitReview.status = 1;
        submitReview.message = decodedResponse['messages'];
        return Future.value(submitReview);
      } else if (statusCode >= 500 && statusCode <= 599) {
        submitReview.status = 0;
        submitReview.message = 'Internal Server Error';
        return Future.value(submitReview);
      }
    } on Exception catch (e) {
      ProgressDialogDotted().hideProgressDialog(context);
      submitReview.status = 0;
      if (e.toString().contains("SocketException"))
        submitReview.message = 'Internet Not Connected';
      else
        submitReview.message = '' + technicalErrorMessage;
      return Future.value(submitReview);
    }
  }

  Future<UploadImageModel> uploadImageApiCall(context, url, base64Image) async {
//  ProgressDialogDotted().showProgressDialog(context);
    var body = {"photo_url": '$base64Image'};
    var headers = {"Content-Type": "application/x-www-form-urlencoded"};
    try {
      final response = await http.post(
        url,
        body: body,
        headers: headers,
      );
      final int statusCode = response.statusCode;
      var decodedResponse = json.decode(response.body);
      //  ProgressDialogDotted().hideProgressDialog(context);
      if (statusCode >= 200 && statusCode <= 299) {
        return UploadImageModel.fromJson(decodedResponse);
      } else if ((statusCode >= 100 && statusCode <= 199) ||
          (statusCode >= 300 && statusCode <= 499) ||
          json == null) {
        uploadImageModel.status = 1;
        uploadImageModel.message = decodedResponse['messages'];
        return Future.value(uploadImageModel);
      } else if (statusCode >= 500 && statusCode <= 599) {
        uploadImageModel.status = 0;
        uploadImageModel.message = 'Internal Server Error';
        return Future.value(uploadImageModel);
      }
    } on Exception catch (e) {
      //ProgressDialogDotted().hideProgressDialog(context);
      uploadImageModel.status = 0;
      if (e.toString().contains("SocketException"))
        uploadImageModel.message = 'Internet Not Connected';
      else
        uploadImageModel.message = '' + technicalErrorMessage;
      return Future.value(uploadImageModel);
    }
  }

  Future<AddShopPhoto> postShopPhotoApiCall(
      context, url, shopID, ownerID, urlPhoto) async {
//  ProgressDialogDotted().showProgressDialog(context);
    var body = {
      "shop_id": '$shopID',
      "owner_id": '$ownerID',
      "photo": '$urlPhoto'
    };
    var headers = {"Content-Type": "application/x-www-form-urlencoded"};
    try {
      final response = await http.post(
        url,
        body: body,
        headers: headers,
      );
      final int statusCode = response.statusCode;
      var decodedResponse = json.decode(response.body);
      //  ProgressDialogDotted().hideProgressDialog(context);
      if (statusCode >= 200 && statusCode <= 299) {
        return AddShopPhoto.fromJson(decodedResponse);
      } else if ((statusCode >= 100 && statusCode <= 199) ||
          (statusCode >= 300 && statusCode <= 499) ||
          json == null) {
        addShopPhoto.status = 1;
        addShopPhoto.message = decodedResponse['messages'];
        return Future.value(addShopPhoto);
      } else if (statusCode >= 500 && statusCode <= 599) {
        addShopPhoto.status = 0;
        addShopPhoto.message = 'Internal Server Error';
        return Future.value(addShopPhoto);
      }
    } on Exception catch (e) {
      //ProgressDialogDotted().hideProgressDialog(context);
      addShopPhoto.status = 0;
      if (e.toString().contains("SocketException"))
        addShopPhoto.message = 'Internet Not Connected';
      else
        addShopPhoto.message = '' + technicalErrorMessage;
      return Future.value(addShopPhoto);
    }
  }

  Future<AddShopLocationModel> addShopLocationApiCall(
      context, url, shopID, lat, lng, address) async {
    ProgressDialogDotted().showProgressDialog(context);
    var userID = await Config.getUserID();
    var body = {
      "shop_id": '$shopID',
      "user_id": "$userID",
      "lat": "$lat",
      "lng": "$lng",
      "address": "$address",
    };
    print("$body");
    var headers = {"Content-Type": "application/x-www-form-urlencoded"};
    try {
      final response = await http.post(
        url,
        body: body,
        headers: headers,
      );
      final int statusCode = response.statusCode;
      print(statusCode);
      var decodedResponse = json.decode(response.body);
      ProgressDialogDotted().hideProgressDialog(context);
      if (statusCode >= 200 && statusCode <= 299) {
        return AddShopLocationModel.fromJson(decodedResponse);
      } else if ((statusCode >= 100 && statusCode <= 199) ||
          (statusCode >= 300 && statusCode <= 499) ||
          json == null) {
        addShopLocationModel.status = 1;
        addShopLocationModel.message = decodedResponse['messages'];
        return Future.value(addShopLocationModel);
      } else if (statusCode >= 500 && statusCode <= 599) {
        addShopLocationModel.status = 0;
        addShopLocationModel.message = 'Internal Server Error';
        return Future.value(addShopLocationModel);
      }
    } on Exception catch (e) {
      ProgressDialogDotted().hideProgressDialog(context);
      addShopLocationModel.status = 0;
      if (e.toString().contains("SocketException"))
        addShopLocationModel.message = 'Internet Not Connected';
      else
        addShopLocationModel.message = '' + technicalErrorMessage;
      return Future.value(addShopLocationModel);
    }
  }

  Future<CreateShopMenu> createShopMenuApiCall(
      context, url, shopID, ownerID, urlPhoto, title, desc, price) async {
    // ProgressDialogDotted().showProgressDialog(context);
    var body = {
      "shop_id": '$shopID',
      "user_id": '$ownerID',
      "img": '$urlPhoto',
      "title": '$title',
      "description": '$desc',
      "price": '$price'
    };
    var headers = {"Content-Type": "application/x-www-form-urlencoded"};
    try {
      final response = await http.post(
        url,
        body: body,
        headers: headers,
      );
      final int statusCode = response.statusCode;
      var decodedResponse = json.decode(response.body);
      // ProgressDialogDotted().hideProgressDialog(context);
      if (statusCode >= 200 && statusCode <= 299) {
        return CreateShopMenu.fromJson(decodedResponse);
      } else if ((statusCode >= 100 && statusCode <= 199) ||
          (statusCode >= 300 && statusCode <= 499) ||
          json == null) {
        createShopMenu.status = 1;
        createShopMenu.message = decodedResponse['messages'];
        return Future.value(createShopMenu);
      } else if (statusCode >= 500 && statusCode <= 599) {
        createShopMenu.status = 0;
        createShopMenu.message = 'Internal Server Error';
        return Future.value(createShopMenu);
      }
    } on Exception catch (e) {
      // ProgressDialogDotted().hideProgressDialog(context);
      createShopMenu.status = 0;
      if (e.toString().contains("SocketException"))
        createShopMenu.message = 'Internet Not Connected';
      else
        createShopMenu.message = '' + technicalErrorMessage;
      return Future.value(createShopMenu);
    }
  }

   Future<BaseResponseModel> deleteShopMenuAndPhoto(url, context, id) async {
    ProgressDialogDotted().showProgressDialog(context);
    url = url + "id=$id";
    try {
      final response = await http.get(url);
      final int statusCode = response.statusCode;
      var decodedResponse = json.decode(response.body);
      print("$url \n $decodedResponse");
      ProgressDialogDotted().hideProgressDialog(context);
      print(decodedResponse);
      if (statusCode >= 200 && statusCode <= 299) {
        return BaseResponseModel.fromJson(decodedResponse);
      } else if ((statusCode >= 100 && statusCode <= 199) ||
          (statusCode >= 300 && statusCode <= 499) ||
          json == null) {
        baseResponseModel.status = 0;
        baseResponseModel.message = decodedResponse['messages'];
        return Future.value(baseResponseModel);
      } else if (statusCode >= 500 && statusCode <= 599) {
        baseResponseModel.status = 0;
        baseResponseModel.message = 'Internal Server Error';
        return Future.value(baseResponseModel);
      }
    } on Exception catch (e) {
      ProgressDialogDotted().hideProgressDialog(context);
      baseResponseModel.status = 0;
      if (e.toString().contains("SocketException"))
        baseResponseModel.message = 'Internet Not Connected';
      else
        baseResponseModel.message = '' + technicalErrorMessage;
      return Future.value(baseResponseModel);
    }
  }

}
