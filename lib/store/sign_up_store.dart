import 'package:dakakini/models/sign_model.dart';
import 'package:dakakini/network/network_calls_apis.dart';
import 'package:dakakini/network/network_services.dart';
import 'package:dakakini/ui/LoginScreen.dart';
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
  String fullName = "";
  @observable
  String email = "";
  @observable
  String password = "";
  @observable
  String userType = "";
  @observable
  String refNo = "";
  @observable
  bool acceptTerms = false;

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  validate(context) {
    if (fullName.isEmpty) {
      showToast("Full Name cannot be empty", true);
      return;
    }
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
    if (userType.isEmpty) {
      showToast("Select Shop Type", true);
      return;
    }
    signUp(context);
  }

  Future<SignUp> signUp(context) async {
    signUpModel = await networkService.signUpUser(
        signUpApi, fullName, email, password, userType, refNo, context);
    if (signUpModel.status == 0) {
      showToast(signUpModel.message, true);
    } else {
      showToast("Registration Sucessfull", false);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
    }
    return signUpModel;
  }

  @observable
  LoadingState state = LoadingState.loading;
}
