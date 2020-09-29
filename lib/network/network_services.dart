import 'dart:convert';
import 'dart:io';
import 'package:dakakini/models/base_response_model.dart';
import 'package:dakakini/models/login_response_model.dart';
import 'package:dakakini/models/ountry_cities_response_model.dart';
import 'package:dakakini/models/sign_model.dart';
import 'package:dakakini/models/user_shop.dart';
import 'package:dakakini/utils/config.dart';
import 'package:dakakini/utils/loaders/progress_dialog.dart';
import 'package:http/http.dart' as http;

class NetworkService {
  LoginResponseModel authModel = new LoginResponseModel();
  SignUp signUpModel = new SignUp();
  UserShop userShopModel = new UserShop();
  CountryCitiesResponse countryCitiesResponse = CountryCitiesResponse();
  BaseResponseModel baseResponseModel = BaseResponseModel();

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

    var body = {
      "email": "$email",
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
}
