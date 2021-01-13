import 'package:cached_network_image/cached_network_image.dart';
import 'package:dakakini/models/user_shop.dart';
import 'package:dakakini/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ShopContactScreen extends StatefulWidget {
  final Datum shopDetail;
  ShopContactScreen({@required this.shopDetail});
  @override
  _ShopContactScreenState createState() => _ShopContactScreenState();
}

class _ShopContactScreenState extends State<ShopContactScreen> {
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
      appBar: AppBar(
        backgroundColor: colorMain,
        title: Text('SHOP CONTACT DETAILS'),
        elevation: 0.0,
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
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
                  SizedBox(height: screenSize.height / 6.5),
                  contactUs(),
                  UIHelper.verticalSpace(40),
                  shopType()
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _coverImg(Size screensize) {
    return Container(
      height: screensize.height / 4,
      color: colorMain,
    );
  }

  Widget contactUs() {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width / 1.5,
        height: 165,
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(7))),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                      alignment: Alignment.centerLeft,
                      width: 32,
                      height: 20,
                      child: Icon(Icons.call, color: colorMain)),
                  Text('${widget.shopDetail.shopDetail.phone}',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black,
                      ))
                ],
              ),
              UIHelper.verticalSpace(10),
              Row(
                children: <Widget>[
                  Container(
                      alignment: Alignment.centerLeft,
                      width: 32,
                      height: 20,
                      child: Icon(Icons.phone_android, color: colorMain)),
                  Text('${widget.shopDetail.shopDetail.cellNo}',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black,
                      ))
                ],
              ),
              UIHelper.verticalSpace(10),
              Row(
                children: <Widget>[
                  Container(
                      alignment: Alignment.centerLeft,
                      width: 32,
                      height: 20,
                      child: Icon(Icons.email, color: colorMain)),
                  Text('${widget.shopDetail.ownerInfo.email}',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black,
                      ))
                ],
              ),
              UIHelper.verticalSpace(10),
              Row(
                children: <Widget>[
                  Container(
                      alignment: Alignment.centerLeft,
                      width: 32,
                      height: 20,
                      child: Icon(Icons.access_time, color: colorMain)),
                  Text(
                      '${widget.shopDetail.shopDetail.openAt.hour}:${widget.shopDetail.shopDetail.openAt.minute}:${widget.shopDetail.shopDetail.openAt.second} - ${widget.shopDetail.shopDetail.closeAt.hour}:${widget.shopDetail.shopDetail.closeAt.minute}:${widget.shopDetail.shopDetail.closeAt.second}',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black,
                      ))
                ],
              ),
            ],
          ),
        ),
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

  shopType() {
    return Container(
      height: 200,
      width: 200,
      child: getIcon(widget.shopDetail.ownerInfo.typeTitle),
    );
  }
}
