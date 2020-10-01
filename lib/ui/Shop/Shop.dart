import 'package:dakakini/models/user_shop.dart';
import 'package:dakakini/store/get_category_store.dart';
import 'package:dakakini/ui/Shop/LocationScreen.dart';
import 'package:dakakini/ui/Shop/NotificationScreen.dart';
import 'package:dakakini/ui/Shop/SeeAllMenu.dart';
import 'package:dakakini/ui/Shop/ShopDetail.dart';
import 'package:dakakini/ui/Shop/ShopProfile.dart';
import 'package:dakakini/ui/Shop/StarRatingScreen.dart';
import 'package:dakakini/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class Shop extends StatefulWidget {
  Datum shopDetail;
  GetShopStore getShopStore;
  Shop({@required this.shopDetail, @required this.getShopStore});
  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  int selectedIndex = 0;
  var title = "Shop Detail";
  int userType = 0;

  @override
  void initState() {
    Config.getUserType().then((value) {
      setState(() {
        userType = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("$title"),
          centerTitle: true,
          backgroundColor: colorMain,
        ),
        body: bottomTabFragments(selectedIndex),
        bottomNavigationBar: bottomNavigationBar());
  }

  bottomNavigationBar() {
    return BottomAppBar(
      child: Container(
        margin: EdgeInsets.only(left: 12.0, right: 12.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Spacer(),
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
            userType == 1005
                ? Spacer()
                : Container(
                    height: 0,
                  ),
            userType == 1005
                ? Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                        onTap: () {
                          updateTabSelection(1);
                        },
                        child: Icon(
                          Icons.star,
                          color: selectedIndex == 1 ? colorMain : colorDivider,
                        )),
                  )
                : Container(
                    height: 0,
                  ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  updateTabSelection(2);
                },
                child: Icon(
                  Icons.location_on,
                  color: selectedIndex == 2 ? colorMain : colorDivider,
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  updateTabSelection(3);
                },
                child: Icon(
                  Icons.notifications,
                  color: selectedIndex == 3 ? colorMain : colorDivider,
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  updateTabSelection(4);
                },
                child: Icon(
                  Icons.person,
                  color: selectedIndex == 4 ? colorMain : colorDivider,
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
      //color of the BottomAppBar
      color: Colors.white,
    );
  }

  void updateTabSelection(int index) {
    if (index == 0) title = "Shop Detail";
    if (index == 1) title = "Review";
    if (index == 2) title = "Locations";
    if (index == 3) title = "Notifications";
    if (index == 4) title = "Profile";
    setState(() {
      selectedIndex = index;
    });
  }

  bottomTabFragments(int pos) {
    switch (pos) {
      case 0:
        return ShopDetailScreen(
          shopDetail: widget.shopDetail,
        );
      case 1:
        return RatingScreen(
          shopDetail: widget.shopDetail,
          getShopStore: widget.getShopStore,
        );
      case 2:
        return LocationScreen(
          shopDetail: widget.shopDetail,
        );
      case 3:
        return NotificationScreen(
          shopDetail: widget.shopDetail,
        );
      case 4:
        return ProfileScreen();
    }
  }
}
