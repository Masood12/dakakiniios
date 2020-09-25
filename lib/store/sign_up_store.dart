import 'dart:convert';

import 'package:dakakini/models/login_response_model.dart';
import 'package:dakakini/models/sign_model.dart';
import 'package:dakakini/network/network_calls_apis.dart';
import 'package:dakakini/network/network_services.dart';
import 'package:dakakini/ui/ShopScreen.dart';
import 'package:dakakini/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'sign_up_store.g.dart';

enum LoadingState { none, loading, error }

class SignUpStore = _SignUpStore with _$SignUpStore;

abstract class _SignUpStore with Store {
  List<ReactionDisposer> _disposers;
  NetworkService networkService = new NetworkService();

  SignUp signUpModel;
  @observable
  String fullName;
  @observable
  String email;
  @observable
  String password;
  @observable
  String userType;
  @observable
  String refNo;

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  Future<SignUp> signUp(context) async {
    if (refNo == "") {
      signUpModel.status = 0;
      signUpModel.message = "Please select user type";
      showToast(signUpModel.message, true);
      return signUpModel;
    }
    signUpModel = await networkService.signUpUser(
        signUpApi, fullName, email, password, userType, refNo, context);
    if (signUpModel.status == 0) {
      showToast(signUpModel.message, true);
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => ShopSearch()));
    }
    return signUpModel;
  }

  @observable
  LoadingState state = LoadingState.loading;
}
