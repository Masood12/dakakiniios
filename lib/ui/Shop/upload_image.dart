import 'dart:convert';
import 'dart:typed_data';
import 'package:dakakini/models/user_shop.dart';
import 'package:dakakini/store/upload_image_store.dart';
import 'package:dakakini/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class UploadImage extends StatefulWidget {
  final Datum shopDetail;
  UploadImage({this.shopDetail});
  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  List<Asset> images = List<Asset>();
  String _error = 'No Error Dectected';

  final uploadImageStore = UploadImageStore();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorMain,
        title: Text("Upload"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: ListView(
          children: <Widget>[
            addAdvImageContainer(),
            SizedBox(
              height: 15.0,
            ),
            uploadImageButton()
          ],
        ),
      ),
    );
  }

  addAdvImageContainer() {
    Asset asset;
    if (images.length > 0) {
      asset = images[0];
    }
    return InkWell(
      onTap: () {
        loadAssets();
      },
      child: new Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          border: Border.all(color: colorMain),
          borderRadius: BorderRadius.all(const Radius.circular(10.0)),
        ),
        child: images.length > 0
            ? Container(
                width: double.infinity,
                height: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: AssetThumb(
                    asset: asset,
                    height: 150,
                    width: 150,
                  ),
                ),
              )
            : InkWell(
                onTap: () {
                  loadAssets();
                },
                child: Icon(
                  Icons.add,
                  color: colorMain,
                ),
              ),
      ),
    );
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = List<Asset>();
    String error = 'No Error Dectected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 1,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          startInAllView: true,
          statusBarColor: "#2A326D",
          actionBarColor: "#2A326D",
          actionBarTitle: "Select Pictures",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
      _error = error;
    });
  }

  uploadImageButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
          color: colorMain,
          textColor: Colors.white,
          child: Text(
            'Upload Image',
          ),
          onPressed: () {
            convertImageToBase64();
            // store.validate(context);
          }),
    );
  }

  convertImageToBase64() {
    images[0].getByteData().then((value) {
      var buffer = value.buffer;
      var base64Image = base64.encode(Uint8List.view(buffer));
      uploadImageStore.base64Image = base64Image.toString();
      uploadImageStore.shopID = widget.shopDetail.shopId;
      uploadImageStore.ownerID = widget.shopDetail.ownerInfo.userId;
       uploadImageStore.validate(context);
    });
  }
}
