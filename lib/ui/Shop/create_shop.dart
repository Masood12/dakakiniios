import 'package:dakakini/utils/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class CreateShopScreen extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<CreateShopScreen>
    with SingleTickerProviderStateMixin {
  var imgUrl, userName, userEmail, userMobile, subject;
  DateTime dateTime;
  List<Asset> images = List<Asset>();
  String _error = 'No Error Dectected';
  var dropDownValue = "Select Shop Category";
  var dropDownValue3 = " Select Shop Type";

  var dropDownValueID = "";

  @override
  void initState() {
    super.initState();
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
        body: postViewAdvertisment(width));
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
          countryTextFilesWidget("City", 'Country'),
          SizedBox(
            height: 15,
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

  labelTextsArea(s) {
    return Observer(
      builder: (_) => Row(
        children: <Widget>[
          Text(
            s,
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
        ],
      ),
    );
  }

  shopDescription(width) {
    return Container(
      width: width,
      child: TextField(
        maxLines: 7,
        style: TextStyle(fontSize: 12),
        //onChanged: (value) => store.company = value,
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
    return Row(
      children: <Widget>[
        Expanded(
          child: InkWell(
            onTap: () {
              //selectLocationPicker(context, widget.dashboardStore);
            },
            child: Observer(
              builder: (_) => Container(
                height: height40,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(),
                    child: new DropdownButton<String>(
                      value: dropDownValue,
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
                      items: <String>[
                        'Select Shop Category',
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
                              //store.userType = dropDownValueID;
                            });
                          },
                        );
                      }).toList(),
                      onChanged: (_) {},
                    ),
                  ),
                ),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  border: Border.all(color: colorMain),
                  borderRadius: BorderRadius.all(
                    Radius.circular(7.0),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  countryTextFilesWidget(city, location) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: InkWell(
            onTap: () {
              // selectCityPicker(context, widget.dashboardStore);
            },
            child: Observer(
              builder: (_) => Container(
                height: height40,
                child: TextField(
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12),
                  //controller: passController,
                  decoration: InputDecoration(
                    enabled: false,
                    fillColor: colorMain,
                    filled: true,
                    hintText: "Select City",
//                      widget.dashboardStore.moreFiltercityName == null
//                          ? "Select City"
//                          : widget.dashboardStore.moreFiltercityName,
                    suffixIcon: Container(
                      child: Icon(
                        Icons.arrow_drop_down,
                        size: prefixIconSize,
                        color: Colors.white,
                      ),
                    ),
                    hintStyle: TextStyle(color: Colors.white),
                    contentPadding: EdgeInsets.all(0.0),
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(const Radius.circular(7.0)),
                        borderSide: BorderSide(color: colorMain, width: 1.0)),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(7.0),
                          topLeft: Radius.circular(7.0)),
                      borderSide: BorderSide(color: colorMain, width: 1.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: InkWell(
            onTap: () {
              //selectLocationPicker(context, widget.dashboardStore);
            },
            child: Observer(
              builder: (_) => Container(
                height: height40,
                alignment: Alignment.centerLeft,
                child: TextField(
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 12),
                  //controller: passController,
                  decoration: InputDecoration(
                    enabled: false,
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Select Location",
//                      widget.dashboardStore.moreFilterlocationName == null
//                          ? "Select Location"
//                          : widget.dashboardStore.moreFilterlocationName,
                    hintStyle: TextStyle(color: hintText),
                    suffixIcon: Container(
                      child: Icon(
                        Icons.arrow_drop_down,
                        size: prefixIconSize,
                        color: Colors.black,
                      ),
                    ),
                    contentPadding: EdgeInsets.all(10.0),
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.all(const Radius.circular(7.0)),
                        borderSide: BorderSide(color: colorMain, width: 1.0)),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(7.0),
                          bottomRight: Radius.circular(7.0)),
                      borderSide: BorderSide(color: colorMain, width: 1.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  userNameTextFeild(width) {
    return TextFormField(
        // focusNode: emailFocus,
        textInputAction: TextInputAction.next,
        //  onChanged: (value) => store.email = value,
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

  shopNameTextFormField(width) {
    return TextFormField(
        // focusNode: emailFocus,
        textInputAction: TextInputAction.next,
        //  onChanged: (value) => store.email = value,
        //  controller: emailController,

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
        // focusNode: emailFocus,
        textInputAction: TextInputAction.next,
        //  onChanged: (value) => store.email = value,
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

  shopCatageory() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(),
          child: new DropdownButton<String>(
            value: dropDownValue,
            isExpanded: true,
            icon: Icon(Icons.keyboard_arrow_down),
            underline: Container(
              height: 0,
              width: 0,
            ),
            items: <String>[
              'Select Shop Type',
              'VIP shop',
              'Gold Shop',
              'Silver Shop',
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
                    if (dropDownValue == "VIP shop") {
                      dropDownValueID = "1003";
                    } else if (dropDownValue == "Gold Shop") {
                      dropDownValueID = "1002";
                    } else if (dropDownValue == "Silver Shop") {
                      dropDownValueID = "1006";
                    }
                    //store.userType = dropDownValueID;
                  });
                },
              );
            }).toList(),
            onChanged: (_) {},
          ),
        ),
        Container(
          height: 1,
          width: MediaQuery.of(context).size.width,
          color: underLineColor,
        )
      ],
    );
  }

  createShop(width) {
    return Observer(
      builder: (_) => RaisedButton(
        padding: EdgeInsets.all(0),
        onPressed: () {
          Navigator.pop(context);
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
}
