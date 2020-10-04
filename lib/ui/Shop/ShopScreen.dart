import 'package:cached_network_image/cached_network_image.dart';
import 'package:dakakini/store/get_category_store.dart';
import 'package:dakakini/ui/Shop/Shop.dart';
import 'package:dakakini/ui/Shop/create_shop.dart';
import 'package:dakakini/ui/Shop/tab_1food.dart';
import 'package:dakakini/ui/Shop/tab_2cloths.dart';
import 'package:dakakini/ui/Shop/tab_3bakhoor.dart';
import 'package:dakakini/utils/config.dart';
import 'package:dakakini/utils/start_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ShopSearch extends StatefulWidget {
  final categoryId;
  ShopSearch({this.categoryId});
  @override
  _ShopSearchState createState() => _ShopSearchState();
}

class _ShopSearchState extends State<ShopSearch>
    with SingleTickerProviderStateMixin {
  GetShopStore getShopStore = GetShopStore();
  int initialIndex = 0;
  TabController _tabController;
  @override
  void initState() {
    initialIndex = widget.categoryId - 1;

    _tabController =
        TabController(vsync: this, initialIndex: initialIndex, length: 3);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorMain,
      floatingActionButton: userType != 1005
          ? FloatingActionButton(
              backgroundColor: colorMain,
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => CreateShopScreen()));
              },
              child: Icon(Icons.add),
            )
          : null,
      body: Container(
        color: Colors.white,
        margin: EdgeInsets.only(top: 25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              color: colorMain,
              padding: EdgeInsets.only(top: 15.0, bottom: 5.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: searchTextFormFeild(),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              color: colorMain,
              child: TabBar(
                  isScrollable: true,
                  indicatorWeight: 2.0,
                  indicatorColor: Colors.white,
                  controller: _tabController,
                  tabs: [
                    Tab(
                      text: 'FOOD & SWEETS',
                    ),
                    Tab(
                      text: 'CLOTHS & ACCESSORIES',
                    ),
                    Tab(
                      text: 'OUD & BAKHOOR',
                    ),
                  ]),
            ),
            Expanded(
              child: TabBarView(controller: _tabController, children: [
                ShopFood(
                  categoryId: 1,
                  getShopStore: getShopStore,
                ),
                ShopCloths(
                  categoryId: 2,
                  getShopStore: getShopStore,
                ),
                ShopBakhoor(
                  categoryId: 3,
                  getShopStore: getShopStore,
                )
              ]),
            )
          ],
        ),
      ),
    );
  }

  searchTextFormFeild() {
    return Container(
      height: height40,
      margin: EdgeInsets.only(right: 15),
      child: TextFormField(
        // onChanged: (value) => store.password = value,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(8.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          hintText: 'Search Shop',
        ),
      ),
    );
  }
}
