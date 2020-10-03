import 'package:dakakini/models/upload_image_model.dart';
import 'package:dakakini/models/add_shop_photo_model.dart';
import 'package:dakakini/network/network_calls_apis.dart';
import 'package:dakakini/network/network_services.dart';
import 'package:dakakini/utils/config.dart';
import 'package:dakakini/utils/loaders/progress_dialog.dart';
import 'package:mobx/mobx.dart';

part 'upload_image_store.g.dart';

class UploadImageStore = _UploadImageStore with _$UploadImageStore;

abstract class _UploadImageStore with Store {
  NetworkService networkService = new NetworkService();

  @observable
  UploadImageModel uploadImageModel;
  @observable
  AddShopPhoto addShopPhoto;
  @observable
  var base64Image;
  @observable
  int shopID;
  @observable
  int ownerID;
  @observable
  var photo;
  var baseUrlImage = "http://application.dakakini.com/uploads/";

  validate(context) {
    if (base64Image == null) {
      showToast("Please select valid image", true);
      return;
    }
    uploadImageToServer(context);
  }

  uploadImageToServer(context) async {
    ProgressDialogDotted().showProgressDialog(context);
    uploadImageModel = await networkService.uploadImageApiCall(
        context, imageUpload, base64Image);
    if (uploadImageModel.status == 0) {
      ProgressDialogDotted().hideProgressDialog(context);
      showToast(uploadImageModel.message, true);
    } else {
      addShopPhotoResource(context, "$baseUrlImage${uploadImageModel.data}");
    }
  }

  Future<AddShopPhoto> addShopPhotoResource(context, photoUrl) async {
    addShopPhoto = await networkService.postShopPhotoApiCall(
        context, addShopPhotoApi, shopID, ownerID, photoUrl);
    ProgressDialogDotted().hideProgressDialog(context);
    if (addShopPhoto.status == 0) {
      showToast(addShopPhoto.message, true);
    } else {
      showToast(addShopPhoto.message, false);
    }
    return addShopPhoto;
  }
}
