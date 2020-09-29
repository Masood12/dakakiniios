import 'package:dakakini/models/base_response_model.dart';
import 'package:dakakini/models/sign_model.dart';
import 'package:dakakini/network/network_calls_apis.dart';
import 'package:dakakini/network/network_services.dart';
import 'package:dakakini/ui/LoginScreen.dart';
import 'package:dakakini/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';


part 'change_password_store.g.dart';

enum LoadingState { none, loading, error }

class ChangePasswordStore = _ChangePasswordStore with _$ChangePasswordStore;

abstract class _ChangePasswordStore with Store {
  List<ReactionDisposer> _disposers;
  NetworkService networkService = new NetworkService();

  BaseResponseModel baseResponseModel;
  @observable
  String oldPassword = "";
  @observable
  String newPassword = "";
  @observable
  int userId;
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  validate(context) {
    Config.getUserID().then((value) {
      userId= value;
    });

    if (oldPassword.isEmpty) {
      showToast("Enter old password", true);
      return;
    }
    if (newPassword.isEmpty) {
      showToast("Email cannot be empty", true);
      return;
    }
    if(userId==null){
      showToast("User id is null", true);
      return;
    }
    chnagePassword(context);
  }

  Future<BaseResponseModel> chnagePassword(context) async {
    baseResponseModel = await networkService.changePassword(changePasswordApi,
        oldPassword, newPassword, userId,context);
    if (baseResponseModel.status == 0) {
      showToast(baseResponseModel.message, true);
    } else {
      showToast(baseResponseModel.message, false);
      Config.clearSharePreference();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
    }
    return baseResponseModel;
  }

  @observable
  LoadingState state = LoadingState.loading;
}
