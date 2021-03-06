import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dakakini/store/create_shop_store.dart';
import 'package:dakakini/utils/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../utils/config.dart';

class CreateShopScreen extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<CreateShopScreen>
    with SingleTickerProviderStateMixin {
  CreateShopStore store = CreateShopStore();
  var imgUrl, userName, userEmail, userMobile, subject;
  DateTime dateTime;
  List<Asset> images = List<Asset>();
  String _error = 'No Error Dectected';
  var dropDownValue;
  var dropDownValue3 = " Select Shop Type";
  var citydropDownValue = " Select Shop City";

  int countryId;
  int cityId;
  var dropDownValueID = "";
  String _mySelection;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      store.citiesCountries(context);
    });
    getCitiesCounriesList();
    super.initState();
  }

  getCitiesCounriesList(){

  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: colorMain,
          centerTitle: false,
          titleSpacing: 0.0,
          title: Text('Create Shop'),
          leading: InkWell(
              onTap: () {
                Future.delayed(Duration.zero, () {
                  Navigator.pop(context);
                });
              },
              child: Icon(Icons.arrow_back)),
          elevation: 0.0,
          // ignore: missing_required_param
        ),
        body: Observer(
    builder: (_) => store.isLoaded?postViewAdvertisment(width):Center(
      child: Center(
        child: Container(
          child: Text("Loading.....",
          style: TextStyle(
            color: colorMain,
            fontSize: 22
          ),),
        ),
      ),
    )));
  }

  postViewAdvertisment(width) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        children: <Widget>[
          //labelTextsArea('Select Image'),
          SizedBox(
            height: 10,
          ),
          addAdvImageContainer(),
          SizedBox(
            height: 10,
          ),
          shopNameTextFormField(width),
          SizedBox(
            height: 5,
          ),
          shopSubTitleTetFormField(width),
          SizedBox(
            height: 15,
          ),
          shopCat(),
          SizedBox(
            height: 15,
          ),

          CountryDropDown(),
          SizedBox(
            height: 10,
          ),
          cityDropDown(),
          SizedBox(
            height: 10,
          ),
          shopDescription(width),
          SizedBox(
            height: 20,
          ),
          createShop(width)
        ],
      ),
    );
  }
  Future checkMediaPermissions() async {
  {
    print(await Permission.mediaLibrary.isGranted);
      if (await Permission.mediaLibrary.isGranted) loadAssets();
      if (await Permission.mediaLibrary.isRestricted ||
          await Permission.mediaLibrary.isUndetermined ||
          await Permission.mediaLibrary.isDenied)
        requestPermission(Permission.mediaLibrary);
      if (await Permission.mediaLibrary.isPermanentlyDenied) {
        if (Platform.isAndroid) {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Can't get gurrent Permission"),
                  content: const Text(
                      'Please make sure you enable permissions  from settings'),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('NO'),
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true).pop();
                      },
                    ),
                    FlatButton(
                      child: Text('YES'),
                      onPressed: () {
                        openAppSettings();
                      },
                    ),
                  ],
                );
              });
        } else {
          showToast("Please Enabled Permissions", true);
        }
      }
    }
  }
  Future<void> requestPermission(Permission permission) async {
    print("permission not granted");
  //  await permission.request();
  }
  convertImageToBase64() {
    if(images.length>0){
      images[0].getByteData().then((value) {
        var buffer = value.buffer;
        store.imagebase64 = base64.encode(Uint8List.view(buffer));
        print('Image base64 :::${store.imagebase64}');
        store.validateData(context);
        //uploadImageApiCall(context, imageUpload, base64Image);
      });
    }else{
      showToast("Select Shop image to continue", true);
    }

  }

  shopDescription(width) {
    return Container(
      width: width,
      child: TextField(
        maxLines: 7,
        style: TextStyle(fontSize: 12),
        onChanged: (value) => store.description = value,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintStyle: TextStyle(fontSize: 12, color: Colors.black),
            hintText: 'Type shop description here',
            contentPadding: EdgeInsets.all(10.0),
            labelStyle:
            TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(const Radius.circular(10.0)),
                borderSide: BorderSide(color: colorMain, width: 1.0)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: colorMain, width: 1.0),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: colorMain, width: 1.0),
            )),
      ),
    );
  }
  
  shopCat() {
    return Column(
      mainAxisSize: MainAxisSize.min,

      children: <Widget>[
        Container(
          height: height40,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.symmetric(),
              child: new DropdownButton<String>(
                value: dropDownValue,
                isExpanded: true,
                hint: Text('Select Shop Category',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12
                ),),
                icon: Icon(
                  Icons.arrow_drop_down,
                  size: prefixIconSize,
                  color: Colors.black,
                ),
                underline: Container(
                  height: 0,
                  width: 0,
                ),
                items: <String>[
                  'Food & Sweets',
                  'Clothes & Accessories',
                  'Oud & Bakhoor',
                ].map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: SizedBox(
                      width: 200,
                      child: Container(
                          child: new Text(
                            value,
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          )),
                    ),
                    onTap: () {
                      setState(() {
                        dropDownValue = value;
                        if (dropDownValue == "Food & Sweets") {
                          dropDownValueID = "1";
                        } else if (dropDownValue == "Clothes & Accessories") {
                          dropDownValueID = "2";
                        } else if (dropDownValue == "Oud & Bakhoor") {
                          dropDownValueID = "3";
                        }
                        store.catId = dropDownValueID;
                      });
                    },
                  );
                }).toList(),
                onChanged: (_) {},
              ),
            ),
          ),
          alignment: Alignment.centerLeft,

        ),
        Container(
          height: 1,
          width: MediaQuery.of(context).size.width,
          color: underLineColor,
        )
      ],
    );
  }


  CountryDropDown() {
    return Column(
      children: <Widget>[
        Container(
          height: height40,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.symmetric(),
              child: new DropdownButton<String>(
                isExpanded: true,
                hint: Text('Select Country',style: TextStyle(
                  color: Colors.black,
                  fontSize: 12
                ),),
                icon: Icon(
                  Icons.arrow_drop_down,
                  size: prefixIconSize,
                  color: Colors.black,
                ),
                underline: Container(
                  height: 0,
                  width: 0,
                ),
                items: store.citiesResponse.data.map((data) {
                  return new DropdownMenuItem<String>(
                    value: _mySelection,
                    child: SizedBox(
                      width: 200,
                      child: Container(
                          child: new Text(
                            data.name,
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          )),
                    ),
                    onTap: () {
                      setState(() {
                        store.countryId = data.countryId;
                       // _error = data.name;
                        //store.userType = dropDownValueID;
                      });
                    },
                  );
                }).toList(),
                onChanged: (newVal) {
                 // _mySelection = newVal;
                },
              ),
            ),
          ),
          alignment: Alignment.centerLeft,

        ),
        Container(
          height: 1,
          width: MediaQuery.of(context).size.width,
          color: underLineColor,
        )
      ],
    );
  }

 cityDropDown() {
    return Column(
      children: <Widget>[
        Container(
          height: height40,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.symmetric(),
              child: new DropdownButton<String>(
                isExpanded: true,
                icon: Icon(
                  Icons.arrow_drop_down,
                  size: prefixIconSize,
                  color: Colors.black,
                ),
                underline: Container(
                  height: 0,
                  width: 0,
                ),
                items: store.citiesResponse.data[0].cities.map((data) {
                  return new DropdownMenuItem<String>(
                    value: _mySelection,
                    child: SizedBox(
                      width: 200,
                      child: Container(
                          child: new Text(
                            data.cityName,
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          )),
                    ),
                    onTap: () {
                      setState(() {
                        store.cityId = data.cityId;
                        //print(cityId);
                        // _error = data.name;
                        //store.userType = dropDownValueID;
                      });
                    },
                  );
                }).toList(),
                onChanged: (newVal) {
                 // _mySelection = newVal;
                },
              ),
            ),
          ),
          alignment: Alignment.centerLeft,

        ),
        Container(
          height: 1,
          width: MediaQuery.of(context).size.width,
          color: underLineColor,
        )
      ],
    );
  }



  shopNameTextFormField(width) {
    return TextFormField(
        textInputAction: TextInputAction.next,
         onChanged: (value) => store.shopName = value,
        //  controller: emailController,
        style: TextStyle(fontSize: 12),
        decoration: InputDecoration(
          hintText: 'Shop Name',
          hintStyle: TextStyle(fontSize: 12, color: Colors.black),
          labelStyle:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: underLineColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: underLineColor),
          ),
        ));
  }

  shopSubTitleTetFormField(width) {
    return TextFormField(
        style: TextStyle(fontSize: 12),
        textInputAction: TextInputAction.next,
         onChanged: (value) => store.shopSubtitle = value,
        //  controller: emailController,

        decoration: InputDecoration(
          hintText: 'Subtitle',
          hintStyle: TextStyle(fontSize: 12, color: Colors.black),
          labelStyle:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: underLineColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: underLineColor),
          ),
        ));
  }


  createShop(width) {
    return Observer(
      builder: (_) => RaisedButton(
        padding: EdgeInsets.all(0),
        onPressed: () {
          convertImageToBase64();
        },
        color: colorMain,
        textColor: Colors.white,
        child: Stack(
          // mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Text(
                'CREATE SHOP',
                style: TextStyle(
                    fontSize: buttonFontSize, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
      ),
    );
  }

  addAdvImageContainer() {
    Asset asset;

    if (images.length > 0) {
      asset = images[0];

      print('image ::: ${images[0].name}');
    }
    return InkWell(
      onTap: () {
        //checkMediaPermissions();
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
                  //checkMediaPermissions();

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


}
