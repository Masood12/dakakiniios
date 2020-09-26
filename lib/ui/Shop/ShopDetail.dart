import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dakakini/utils/color_safe_area.dart';
import 'package:dakakini/utils/config.dart';
import 'package:dakakini/utils/start_rating.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShopDetailScreen extends StatefulWidget {
  @override
  _ShopDetailScreenState createState() => _ShopDetailScreenState();
}

class _ShopDetailScreenState extends State<ShopDetailScreen> {
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 25),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              topPortion(),
              Container(
                color: smokeybgColor,
                height: 10,
              ),
              middlePortion(),
              Container(
                color: smokeybgColor,
                height: 10,
              ),
              bottomPortion()
            ],
          ),
        ),
      ),
    );
  }

  topPortion() {
    return Container(
      margin: EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: CachedNetworkImage(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                  imageUrl:
                      "https://www.arabnews.pk/sites/default/files/styles/n_670_395/public/2020/08/10/2224091-247797304.jpg?itok=O4ZNv0aI",
                  placeholder: (context, url) => noImageAvailable(
                      height: 250.0, width: MediaQuery.of(context).size.width),
                  errorWidget: (context, url, error) => noImageAvailable(
                      height: 250.0, width: MediaQuery.of(context).size.width)),
            ),
          ),
          UIHelper.verticalSpace(10),
          Row(
            children: <Widget>[
              Text(
                "my shop vip",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              )
            ],
          ),
          UIHelper.verticalSpace(5),
          Text(
            "test",
            style: TextStyle(fontSize: 12, color: smokeyColor),
          ),
          UIHelper.verticalSpace(5),
          Row(
            children: <Widget>[
              Container(
                child: IconTheme(
                  data: IconThemeData(
                    color: Colors.amber,
                    size: 15,
                  ),
                  child: StarRating(
                    rating: 2.6,
                  ),
                ),
              ),
              Text(
                "Reviews ",
                style: TextStyle(fontSize: 12, color: smokeyColor),
              ),
            ],
          ),
          UIHelper.verticalSpace(15),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        " OPEN IN ",
                        style: TextStyle(fontSize: 12, color: smokeyColor),
                      ),
                      UIHelper.verticalSpace(4),
                      Text(
                        "14:12:22",
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              contactUsBotton()
            ],
          ),
        ],
      ),
    );
  }

  contactUsBotton() {
    return Container(
      child: RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
          color: colorMain,
          textColor: Colors.white,
          child: Row(
            children: <Widget>[
              Icon(
                Icons.call,
                size: 13,
              ),
              UIHelper.horizontalSpace(5),
              Text("Contact Us"),
            ],
          ),
          onPressed: () {}),
    );
  }

  middlePortion() {
    return Container(
      margin: EdgeInsets.all(15.0),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Photos",
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey),
          ),
          UIHelper.verticalSpace(10),
          Container(
            height: 120,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      child: CachedNetworkImage(
                          height: 100,
                          width: 120,
                          fit: BoxFit.fill,
                          imageUrl:
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSmwE8vAaXmMYCtgFLOlnDPxzlPzjFOMpulFQ&usqp=CAU",
                          placeholder: (context, url) =>
                              noImageAvailable(height: 100.0, width: 100.0),
                          errorWidget: (context, url, error) =>
                              noImageAvailable(height: 100.0, width: 100.0)),
                    ),
                  );
                }),
          ),
          UIHelper.verticalSpace(10),
          Text(
            "Shop Location",
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey),
          ),
          UIHelper.verticalSpace(10),
          Container(
            height: 200,
            child: GoogleMap(
              mapType: MapType.normal,
              zoomControlsEnabled: false,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
          UIHelper.verticalSpace(10),
          Text(
            "Description",
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey),
          ),
          UIHelper.verticalSpace(5),
          Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 14, color: Colors.black),
          ),
        ],
      ),
    );
  }

  bottomPortion() {
    return Container(
        margin: EdgeInsets.all(15.0),
        alignment: Alignment.centerLeft,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    "Menus",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  ),
                  Expanded(
                    child: Text(
                      "See All",
                      textAlign: TextAlign.end,
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                ],
              ),
              UIHelper.verticalSpace(10),
              Container(
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 3,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return menuCard();
                    }),
              ),
              UIHelper.verticalSpace(15),
              Row(
                children: <Widget>[
                  Text(
                    "Reviews",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey),
                  ),
                  Expanded(
                    child: Text(
                      "See All",
                      textAlign: TextAlign.end,
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                ],
              ),
              UIHelper.verticalSpace(10),
              Container(
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 3,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return reviewsCard();
                    }),
              ),
              UIHelper.verticalSpace(10),
            ]));
  }

  menuCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              child: CachedNetworkImage(
                  height: 80,
                  width: 80,
                  fit: BoxFit.fill,
                  imageUrl:
                      "https://images.unsplash.com/photo-1571091718767-18b5b1457add?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
                  placeholder: (context, url) =>
                      noImageAvailable(height: 80.0, width: 80.0),
                  errorWidget: (context, url, error) =>
                      noImageAvailable(height: 80.0, width: 80.0)),
            ),
            Expanded(
                child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Burger Bistro",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  UIHelper.verticalSpace(5),
                  Text(
                    "Serving 1 Person",
                    style: TextStyle(fontSize: 12, color: smokeyColor),
                  ),
                  UIHelper.verticalSpace(5),
                  Text(
                    "AED 150",
                    style: TextStyle(fontSize: 12, color: smokeyColor),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  reviewsCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(100.0)),
              child: CachedNetworkImage(
                  height: 50,
                  width: 50,
                  fit: BoxFit.fill,
                  imageUrl: "https://img.icons8.com/plasticine/2x/user.png",
                  placeholder: (context, url) =>
                      noImageAvailable(height: 50.0, width: 50.0),
                  errorWidget: (context, url, error) =>
                      noImageAvailable(height: 50.0, width: 50.0)),
            ),
            Expanded(
                child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        "Ellen John",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  UIHelper.verticalSpace(5),
                  Text(
                    "A small, dimly-lit room covered in deep hues and antique cutlery, Chef’s Table definitely checked all boxes for fine dining.",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12, color: smokeyColor),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
