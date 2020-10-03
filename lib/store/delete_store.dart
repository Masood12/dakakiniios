import 'package:dakakini/models/base_response_model.dart';
import 'package:dakakini/network/network_calls_apis.dart';
import 'package:dakakini/network/network_services.dart';
import 'package:dakakini/utils/config.dart';
import 'package:mobx/mobx.dart';

part 'delete_store.g.dart';

class DeleteStore = _DeleteStore with _$DeleteStore;

abstract class _DeleteStore with Store {
  NetworkService networkService = new NetworkService();

  @observable
  BaseResponseModel baseResponseModel;

  @observable
  int itemID;
  @observable
  bool isShopPhotoID;

  deleteApi(context) async {
    baseResponseModel = await networkService.deleteShopMenuAndPhoto(context,
        isShopPhotoID ? deleteShopPhotoApi : deleteShopMenuApi, itemID);
    if (baseResponseModel.status == 0) {
      showToast(baseResponseModel.message, true);
    } else {
      showToast(baseResponseModel.message, false);
    }
  }
}
