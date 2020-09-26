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
    return ColoredSafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
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
              ],
            ),
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
                      "https://images.unsplash.com/photo-1448630360428-65456885c650?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
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
                              "https://images.unsplash.com/photo-1448630360428-65456885c650?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
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
}
