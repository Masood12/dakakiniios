import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
//import 'package:flutter_svg/svg.dart';

import 'package:multi_image_picker/multi_image_picker.dart';

import '../../utils/config.dart';


class EditProfileScrren extends StatefulWidget {
  //final Datum realEstateData;
 // final String profilePicUrl;
 // EditProfileScrren({this.realEstateData, this.profilePicUrl});

  @override
  _EditProfileScrrenState createState() => _EditProfileScrrenState();
}

class _EditProfileScrrenState extends State<EditProfileScrren> {
  var imgUrl, userName, userEmail, userMobile, subject;
  DateTime dateTime;
  List<Asset> images = List<Asset>();
  String _error = 'No Error Dectected';
  var dropDownValue = "Select Shop Category";
  var dropDownValue3 = " Select Shop Type";
  int countryId;
  var dropDownValueID = "";
  String _mySelection;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: colorDivider,
      appBar: AppBar(backgroundColor: colorMain,title: Text('EDIT PROFILE'),
        elevation: 0.0,
        centerTitle: true,
        leading: GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                _coverImg(screenSize),
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: screenSize.height /6.5,
                    ),
                    _profileImg(),
                    SizedBox(
                      height: 10,
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(left:15.0,right: 15),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            shopNameTextFormField(width),
                            SizedBox(
                              height: 10,
                            ),
                            shopSubTitleTetFormField(width),
                            SizedBox(
                              height: 10,
                            ),
                            shopphoneTextFeild(width),
                            SizedBox(
                              height: 10,
                            ),
                            shoppopenTimingTextFeild(width),
                            SizedBox(
                              height: 10,
                            ),
                            shoppcloseTimingTextFeild(width),
                            SizedBox(
                              height: 10,
                            ),
                            shoppwebsiteTextFeild(width),
                            SizedBox(
                              height: 10,
                            ),
                            shopCat(),
                            SizedBox(
                              height: 15,
                            ),
                            cityDropDown(),
                            // CountryDropDown(),
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
                      ),
                    )
                  ],
                ),

              ],
            ),


        ),
      ),
    );
  }
  Widget _coverImg(Size screensize) {
    return Stack(
      children: <Widget>[
        Container(
          height: screensize.height / 4.5,
          color: colorMain,
        ),

      ],
    );
  }
  Widget _profileImg() {
    return Center(
        child: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width/1.1,
              height: 165,
              decoration:BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(Radius.circular(7))
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(7),
                          topRight: Radius.circular(7),
                        ),
                        child: CachedNetworkImage(
                          fit: BoxFit.fill,
                          height: 150,
                          imageUrl: "",
                          placeholder: (context, url) => Container(
                            color: Color(0xffd8d6d9),
                            child: Image.asset(
                              "assets/no_image.png",
                              height: 150,
                            width: MediaQuery.of(context).size.width,

                            ),
                          ),
                          errorWidget: (context, url, error) => Container(
                            color: Color(0xffd8d6d9),
                            child: Image.asset(
                              "assets/no_image.png",
                              height: 150,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
  Widget personalInfo() {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0, left: 15.0, right: 15.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(Icons.business_center, color: colorMain),
              SizedBox(
                width: 10,
              ),
              Text(
                'Works at Trucker HangOut',
                style: TextStyle(color: Colors.black, fontSize: 12.0),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.home,
                color: colorMain,
              ),
              SizedBox(
                width: 10,
              ),
              Text('564',
                style: TextStyle(color: Colors.black, fontSize: 12.0),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Icon(Icons.alternate_email, color: colorMain),
              SizedBox(
                width: 10,
              ),
              Text(
                '556',
                style: TextStyle(color: Colors.black, fontSize: 12.0),
              )
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Divider(
              height: 1,
              thickness: 1,
              color: colorDivider,
            ),
          )
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
    return Column(
      children: <Widget>[
        Container(
          height: height40,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.symmetric(),
              child: new DropdownButton<String>(
                hint: Text('Select Shop Category',style: TextStyle(
                    color: Colors.black,
                    fontSize: 12
                ),),
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

        ),
        Container(
          height: 1,
          width: MediaQuery.of(context).size.width,
          color: colorMain,
        )
      ],
    );
  }


  // CountryDropDown() {
  //   return Column(
  //     children: <Widget>[
  //       Container(
  //         height: height40,
  //         child: Padding(
  //           padding: const EdgeInsets.all(8.0),
  //           child: Container(
  //             padding: EdgeInsets.symmetric(),
  //             child: new DropdownButton<String>(
  //               isExpanded: true,
  //               hint: Text('Select Country',style: TextStyle(
  //                   color: Colors.black,
  //                   fontSize: 12
  //               ),),
  //               icon: Icon(
  //                 Icons.arrow_drop_down,
  //                 size: prefixIconSize,
  //                 color: Colors.black,
  //               ),
  //               underline: Container(
  //                 height: 0,
  //                 width: 0,
  //               ),
  //               items: store.citiesResponse.data.map((data) {
  //                 return new DropdownMenuItem<String>(
  //                   value: _mySelection,
  //                   child: SizedBox(
  //                     width: 200,
  //                     child: Container(
  //                         child: new Text(
  //                           data.name,
  //                           style: TextStyle(color: Colors.black, fontSize: 12),
  //                         )),
  //                   ),
  //                   onTap: () {
  //                     setState(() {
  //                       // _error = data.name;
  //                       //store.userType = dropDownValueID;
  //                     });
  //                   },
  //                 );
  //               }).toList(),
  //               onChanged: (newVal) {
  //                 _mySelection = newVal;
  //               },
  //             ),
  //           ),
  //         ),
  //         alignment: Alignment.centerLeft,
  //
  //       ),
  //       Container(
  //         height: 1,
  //         width: MediaQuery.of(context).size.width,
  //         color: colorMain,
  //       )
  //     ],
  //   );
  // }

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

        ),
        Container(
          height: 1,
          width: MediaQuery.of(context).size.width,
          color: colorMain,
        )
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
            borderSide: BorderSide(color: colorMain),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: colorMain),
          ),
        ));
  }

  shopphoneTextFeild(width) {
    return TextFormField(
      // focusNode: emailFocus,
        textInputAction: TextInputAction.next,
        //  onChanged: (value) => store.email = value,
        //  controller: emailController,

        decoration: InputDecoration(
          hintText: 'Shop phone number',
          hintStyle: TextStyle(fontSize: 12, color: Colors.black),
          labelStyle:
          TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: colorMain),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: colorMain),
          ),
        ));
  }
  shoppopenTimingTextFeild(width) {
    return TextFormField(
      // focusNode: emailFocus,
        textInputAction: TextInputAction.next,
        //  onChanged: (value) => store.email = value,
        //  controller: emailController,

        decoration: InputDecoration(
          hintText: 'Shop Open Timings',
          hintStyle: TextStyle(fontSize: 12, color: Colors.black),
          labelStyle:
          TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: colorMain),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: colorMain),
          ),
        ));
  }
  shoppcloseTimingTextFeild(width) {
    return TextFormField(
      // focusNode: emailFocus,
        textInputAction: TextInputAction.next,
        //  onChanged: (value) => store.email = value,
        //  controller: emailController,

        decoration: InputDecoration(
          hintText: 'Shop Close Timings',
          hintStyle: TextStyle(fontSize: 12, color: Colors.black),
          labelStyle:
          TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: colorMain),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: colorMain),
          ),
        ));
  }
  shoppwebsiteTextFeild(width) {
    return TextFormField(
      // focusNode: emailFocus,
        textInputAction: TextInputAction.next,
        //  onChanged: (value) => store.email = value,
        //  controller: emailController,

        decoration: InputDecoration(
          hintText: 'Shop Website',
          hintStyle: TextStyle(fontSize: 12, color: Colors.black),
          labelStyle:
          TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: colorMain),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: colorMain),
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
            borderSide: BorderSide(color: colorMain),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: colorMain),
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
            borderSide: BorderSide(color: colorMain),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: colorMain),
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
          color: colorMain,
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
                'UPDATE PROFILE',
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
