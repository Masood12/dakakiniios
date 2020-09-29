import 'dart:convert';

import 'package:dakakini/models/login_response_model.dart';
import 'package:dakakini/network/network_calls_apis.dart';
import 'package:dakakini/network/network_services.dart';
import 'package:dakakini/ui/HomeScreen.dart';
import 'package:dakakini/ui/change_password_screen.dart';
import 'package:dakakini/utils/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'sign_in_store.g.dart';

enum LoadingState { none, loading, error }

class SignInStore = _SignInStore with _$SignInStore;

abstract class _SignInStore with Store {
  NetworkService networkService = new NetworkService();

  @observable
  LoginResponseModel loginResponseModel;
  @observable
  String email = '';
  @observable
  String password = '';
  @observable
  bool rememberMe = false;


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
    if (password.isEmpty) {
      showToast("Password cannot be empty", true);
      return;
    }
    signIn(context);
  }
  Future<LoginResponseModel> signIn(context) async {
    loginResponseModel = await networkService.outhUser(
        outhUserApi, email, password, context);
    if (loginResponseModel.status == 0) {
      showToast(loginResponseModel.message, true);
    } else {

      Config.setUserName("${loginResponseModel.data.name}");
      Config.setUserEmail("${loginResponseModel.data.email}");
      Config.setUserProfilePicture(
          "${loginResponseModel.data.image}");
      Config.setUserID(loginResponseModel.data.userId);
      Config.setUserType(loginResponseModel.data.userType);
      // Config.setUserMobile("${response.data.user}");
      if(loginResponseModel.data.userType==1005){
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
              (Route<dynamic> route) => false,
        );
      }else{

        if(loginResponseModel.data.isexpire){
          showToast("Contact Admin to approve", true);
        }else{
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
                (Route<dynamic> route) => false,
          );
        }
      }
    }
    return loginResponseModel;
  }



}


