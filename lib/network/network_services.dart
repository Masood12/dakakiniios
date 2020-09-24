import 'dart:convert';
import 'dart:io';
import 'package:dakakini/models/login_response_model.dart';
import 'package:dakakini/utils/config.dart';
import 'package:dakakini/utils/loaders/progress_dialog.dart';
import 'package:http/http.dart' as http;

class NetworkService {
  LoginResponseModel authModel = new LoginResponseModel();

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

    var body = jsonEncode({});
    try {
      final response =
          await http.post(url + "email=$email&pass=$password", body: body);
      final int statusCode = response.statusCode;
      print(statusCode);
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


}
