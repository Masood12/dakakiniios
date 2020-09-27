import 'package:cached_network_image/cached_network_image.dart';
import 'package:dakakini/ui/Shop/ShopDetail.dart';
import 'package:dakakini/utils/config.dart';
import 'package:dakakini/utils/start_rating.dart';
import 'package:flutter/material.dart';

class ShopSearch extends StatefulWidget {
  @override
  _ShopSearchState createState() => _ShopSearchState();
}

class _ShopSearchState extends State<ShopSearch>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  bool singleLineCard = false;
  @override
  void initState() {
    _tabController = TabController(vsync: this, initialIndex: 0, length: 3);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorMain,
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: Container(
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
                      Navigator.canPop(context);
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
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              color: smokeybgColor,
              child: Row(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.filter),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Filter")
                    ],
                  ),
                  Spacer(),
                  Row(
                    children: <Widget>[
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              singleLineCard = !singleLineCard;
                            });
                          },
                          child: Icon(Icons.list)),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              singleLineCard = !singleLineCard;
                            });
                          },
                          child: Icon(Icons.line_style)),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: shopListView(),
            )
          ],
        ),
      ),
    );
  }

  shopListView() {
    return GridView.count(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      crossAxisCount: !singleLineCard ? 2 : 1,
      childAspectRatio: !singleLineCard ? 0.7 : 1.4,
      children: List.generate(6, (index) {
        return ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ShopDetailScreen()),
              );
            },
            child: Card(
              elevation: 1.0,
              child: Container(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      child: CachedNetworkImage(
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.fill,
                          imageUrl:
                              "https://images.unsplash.com/photo-1448630360428-65456885c650?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
                          placeholder: (context, url) => noImageAvailable(
                              height: 150.0,
                              width: MediaQuery.of(context).size.width),
                          errorWidget: (context, url, error) =>
                              noImageAvailable(
                                  height: 150.0,
                                  width: MediaQuery.of(context).size.width)),
                    ),
                    UIHelper.verticalSpace(5),
                    Row(
                      children: <Widget>[Text("my shop vip")],
                    ),
                    UIHelper.verticalSpace(5),
                    Text("test"),
                    UIHelper.verticalSpace(5),
                    Text("test"),
                    UIHelper.verticalSpace(5),
                    Row(
                      children: <Widget>[
                        Text("Reviews "),
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
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
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
