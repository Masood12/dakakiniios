import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dakakini/ui/Shop/SeeAllMenu.dart';
import 'package:dakakini/ui/Shop/SeeAllReviews.dart';
import 'package:dakakini/ui/Shop/ShopScreen.dart';
import 'package:dakakini/utils/color_safe_area.dart';
import 'package:dakakini/utils/config.dart';
import 'package:dakakini/utils/start_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: shopDetail(),
        ),
        bottomNavigationBar: bottomNavigationBar());
  }

  shopDetail() {
    return SafeArea(
      child: SingleChildScrollView(
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
              bottomPortion()
            ],
          ),
        ),
      ),
    );
  }

  topPortion() {
    return Container(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 15),
                child: CarouselSlider.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int itemIndex) =>
                      Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      child: CachedNetworkImage(
                          height: 1000,
                          width: 1000,
                          fit: BoxFit.fill,
                          imageUrl:
                              "https://www.arabnews.pk/sites/default/files/styles/n_670_395/public/2020/08/10/2224091-247797304.jpg?itok=O4ZNv0aI",
                          placeholder: (context, url) => noImageAvailable(
                              height: 250.0,
                              width: MediaQuery.of(context).size.width),
                          errorWidget: (context, url, error) =>
                              noImageAvailable(
                                  height: 250.0,
                                  width: MediaQuery.of(context).size.width)),
                    ),
                  ),
                  options: CarouselOptions(
                    height: 230,
                    enlargeCenterPage: true,
                    viewportFraction: 0.8,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(15),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      color: colorMain,
                      height: 40,
                      width: 40,
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                UIHelper.verticalSpace(15),
                Row(
                  children: <Widget>[
                    Text(
                      "my shop vip",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
                              style:
                                  TextStyle(fontSize: 12, color: smokeyColor),
                            ),
                            UIHelper.verticalSpace(4),
                            Text(
                              "14:12:22",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    contactUsBotton()
                  ],
                ),
                UIHelper.verticalSpace(10),
              ],
            ),
          )
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
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SeeAllMenu()),
                        );
                      },
                      child: Text(
                        "See All",
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
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
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SeeAllReviews()),
                        );
                      },
                      child: Text(
                        "See All",
                        textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
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

  bottomNavigationBar() {
    return BottomAppBar(
      child: Container(
        margin: EdgeInsets.only(left: 12.0, right: 12.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                  onTap: () {
                    updateTabSelection(0);
                  },
                  child: Icon(
                    Icons.home,
                    color: selectedIndex == 0 ? colorMain : colorDivider,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  updateTabSelection(1);
                },
                child: Icon(
                  Icons.location_on,
                  color: selectedIndex == 1 ? colorMain : colorDivider,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  updateTabSelection(2);
                },
                child: Icon(
                  Icons.notifications,
                  color: selectedIndex == 2 ? colorMain : colorDivider,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  updateTabSelection(3);
                },
                child: Icon(
                  Icons.person,
                  color: selectedIndex == 3 ? colorMain : colorDivider,
                ),
              ),
            ),
          ],
        ),
      ),
      //color of the BottomAppBar
      color: Colors.white,
    );
  }

  void updateTabSelection(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  bottomTabFragments(int pos) {
    switch (pos) {
      case 0:
        return Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ShopDetailScreen()),
        );
      case 1:
        return Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SeeAllMenu()),
        );
      case 2:
        return Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SeeAllMenu()),
        );
      case 3:
        return Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SeeAllMenu()),
        );
    }
  }
}
