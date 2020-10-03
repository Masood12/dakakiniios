import 'package:dakakini/models/upload_image_model.dart';
import 'package:dakakini/models/add_shop_photo_model.dart';
import 'package:dakakini/network/network_calls_apis.dart';
import 'package:dakakini/network/network_services.dart';
import 'package:dakakini/utils/config.dart';
import 'package:dakakini/models/create_shop_menu_model.dart';
import 'package:dakakini/utils/loaders/progress_dialog.dart';
import 'package:mobx/mobx.dart';

part 'create_menu_store.g.dart';

class CreateMenuStore = _CreateMenuStore with _$CreateMenuStore;

abstract class _CreateMenuStore with Store {
  NetworkService networkService = new NetworkService();

  @observable
  UploadImageModel uploadImageModel;
  @observable
  CreateShopMenu createShopMenu;
  @observable
  var base64Image;
  @observable
  int shopID;
  @observable
  int ownerID;
  @observable
  var title;
  @observable
  var desc;
  @observable
  var price;
  var baseUrlImage = "http://application.dakakini.com/uploads/";

  validate(context) {
    if (base64Image == null) {
      showToast("Please select valid image", true);
      return;
    }
    if (title == null) {
      showToast("Title can't be empty", true);
      return;
    }

    if (price == null) {
      showToast("Price can't be empty", true);
      return;
    }
    if (desc == null) {
      showToast("Description can't be empty", true);
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
      createShopMenuResource(context, "$baseUrlImage${uploadImageModel.data}");
    }
  }

  Future<CreateShopMenu> createShopMenuResource(context, photoUrl) async {
    createShopMenu = await networkService.createShopMenuApiCall(context,
        createShopMenuApi, shopID, ownerID, photoUrl, title, desc, price);
    ProgressDialogDotted().hideProgressDialog(context);
    if (createShopMenu.status == 0) {
      showToast(createShopMenu.message, true);
    } else {
      showToast(createShopMenu.message, false);
    }
    return createShopMenu;
  }
}
