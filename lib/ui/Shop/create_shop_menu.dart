import 'package:dakakini/utils/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class AddShopMenuScreen extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<AddShopMenuScreen>
    with SingleTickerProviderStateMixin {
  var imgUrl, userName, userEmail, userMobile, subject;
  DateTime dateTime;
  List<Asset> images = List<Asset>();
  String _error = 'No Error Dectected';
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
          title: Text('Shop Menu'),
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
          addMenuImage(),
          SizedBox(
            height: 10,
          ),
          menuTitle(width),
          SizedBox(
            height: 5,
          ),
          menuPrice(width),

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
        maxLines: 4,
        style: TextStyle(fontSize: 12),
        //onChanged: (value) => store.company = value,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintStyle: TextStyle(fontSize: 12, color: Colors.black),
            hintText: 'Type menu description here',
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



  menuTitle(width) {
    return TextFormField(
        // focusNode: emailFocus,
        textInputAction: TextInputAction.next,
        //  onChanged: (value) => store.email = value,
        //  controller: emailController,

        decoration: InputDecoration(
          hintText: 'Menu Name',
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

  menuPrice(width) {
    return TextFormField(
        // focusNode: emailFocus,
        textInputAction: TextInputAction.next,
        //  onChanged: (value) => store.email = value,
        //  controller: emailController,

        decoration: InputDecoration(
          hintText: 'Menu Price',
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
                'ADD MENU',
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

  addMenuImage() {
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
