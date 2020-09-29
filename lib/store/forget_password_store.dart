import 'package:dakakini/models/base_response_model.dart';
import 'package:dakakini/models/sign_model.dart';
import 'package:dakakini/network/network_calls_apis.dart';
import 'package:dakakini/network/network_services.dart';
import 'package:dakakini/ui/LoginScreen.dart';
import 'package:dakakini/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';


part 'forget_password_store.g.dart';

enum LoadingState { none, loading, error }

class ForgetPasswordStore = _ForgetPasswordStore with _$ForgetPasswordStore;

abstract class _ForgetPasswordStore with Store {
  List<ReactionDisposer> _disposers;
  NetworkService networkService = new NetworkService();

  BaseResponseModel baseResponseModel;
  @observable
  String email = "";


  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  validate(context) {

    if (email.isEmpty) {
      showToast("Email cannot be empty", true);
      return;
    }
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      showToast("Invalid Email", true);
      return;
    }

    forgetPassowrd(context);
  }

  Future<BaseResponseModel> forgetPassowrd(context) async {
    baseResponseModel = await networkService.forgetPassword(
        forgetPasswordApi, email ,context);
    if (baseResponseModel.status == 0) {
      showToast(baseResponseModel.message, true);
    } else {
      showToast(baseResponseModel.message, false);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
    }
    return baseResponseModel;
  }

  @observable
  LoadingState state = LoadingState.loading;
}
