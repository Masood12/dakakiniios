import 'package:cached_network_image/cached_network_image.dart';
import 'package:dakakini/models/user_shop.dart';
import 'package:dakakini/ui/Shop/AddLocationScreen.dart';
import 'package:dakakini/ui/Shop/LocationScreen.dart';
import 'package:dakakini/ui/Shop/upload_image.dart';
import 'package:intl/intl.dart';
import 'package:dakakini/ui/Shop/SeeAllMenu.dart';
import 'package:dakakini/ui/Shop/SeeAllReviews.dart';
import 'package:dakakini/utils/config.dart';
import 'package:dakakini/utils/start_rating.dart';
import 'package:flutter/material.dart';

class ShopDetailScreen extends StatefulWidget {
  final Datum shopDetail;
  ShopDetailScreen({@required this.shopDetail});
  @override
  _ShopDetailScreenState createState() => _ShopDetailScreenState();
}

class _ShopDetailScreenState extends State<ShopDetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return shopDetail();
  }

  shopDetail() {
    return SingleChildScrollView(
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
    );
  }

  topPortion() {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: CachedNetworkImage(
                  height: 230,
                  fit: BoxFit.fill,
                  imageUrl: "${widget.shopDetail.featureImg}",
                  placeholder: (context, url) => noImageAvailable(
                      height: 250.0, width: MediaQuery.of(context).size.width),
                  errorWidget: (context, url, error) => noImageAvailable(
                      height: 250.0, width: MediaQuery.of(context).size.width)),
            ),
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
                      "${widget.shopDetail.name}",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                UIHelper.verticalSpace(5),
                Text(
                  "${widget.shopDetail.subTitle}",
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
                          rating: calculateReview(widget.shopDetail),
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
                              "${DateFormat.jm().format(widget.shopDetail.shopDetail.openAt)}",
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
          onPressed: () {
            //launchCaller("tell:${widget.shopDetail.shopDetail.cellNo}");
          }),
    );
  }

  middlePortion() {
    return Container(
      margin: EdgeInsets.all(15.0),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                "Photos",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
              Spacer(),
              loginUserID == widget.shopDetail.userId
                  ? GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UploadImage(
                                    shopDetail: widget.shopDetail,
                                  )),
                        );
                      },
                      child: Icon(Icons.add),
                    )
                  : Container()
            ],
          ),
          UIHelper.verticalSpace(10),
          Container(
            height: widget.shopDetail.shopPhotoes.length > 0 ? 120 : 0,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.shopDetail.shopPhotoes.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var shopImage =
                      "${widget.shopDetail.shopPhotoes[index].photo}";
                  return Container(
                    margin: EdgeInsets.only(right: 10),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      child: CachedNetworkImage(
                          height: 100,
                          width: 120,
                          fit: BoxFit.fill,
                          imageUrl: "$shopImage",
                          placeholder: (context, url) =>
                              noImageAvailable(height: 100.0, width: 100.0),
                          errorWidget: (context, url, error) =>
                              noImageAvailable(height: 100.0, width: 100.0)),
                    ),
                  );
                }),
          ),
          UIHelper.verticalSpace(20),
          Row(
            children: <Widget>[
              Text(
                "Shop Location",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
              Spacer(),
              loginUserID == widget.shopDetail.userId
                  ? GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddLocationScreen(
                              
                                    shopDetail: widget.shopDetail,
                                  )),
                        );
                      },
                      child: Icon(Icons.add),
                    )
                  : Container()
            ],
          ),
          UIHelper.verticalSpace(20),
          Container(
              height: 200,
              child: LocationScreen(
                shopDetail: widget.shopDetail,
              )),
          UIHelper.verticalSpace(10),
          Text(
            "Description",
            textAlign: TextAlign.start,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey),
          ),
          UIHelper.verticalSpace(5),
          Text(
            "${widget.shopDetail.description}",
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
                  Spacer(),
                  loginUserID == widget.shopDetail.userId
                      ? GestureDetector(
                          onTap: () {},
                          child: Icon(Icons.add),
                        )
                      : Container()
                ],
              ),
              UIHelper.verticalSpace(10),
              Container(
                child: ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: widget.shopDetail.shopMenu.length > 3
                        ? 3 + 1
                        : widget.shopDetail.shopMenu.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return menuCard(index);
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
                              builder: (context) => SeeAllReviews(
                                    shopReview: widget.shopDetail.shopReview,
                                  )),
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
                    itemCount: widget.shopDetail.shopReview.length > 3
                        ? 3
                        : widget.shopDetail.shopReview.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return reviewsCard(index);
                    }),
              ),
              UIHelper.verticalSpace(10),
            ]));
  }

  menuCard(index) {
    if (index < 3) {
      var title = "${widget.shopDetail.shopMenu[index].title}";
      var desc = "${widget.shopDetail.shopMenu[index].description}";
      var image = "${widget.shopDetail.shopMenu[index].img}";
      var price = "${widget.shopDetail.shopMenu[index].price}";

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
                    imageUrl: "$image",
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
                      "$title",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    UIHelper.verticalSpace(5),
                    Text(
                      "$desc",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(fontSize: 12, color: smokeyColor),
                    ),
                    UIHelper.verticalSpace(5),
                    Text(
                      "$price",
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
    return Card(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SeeAllMenu(
                      shopMenu: widget.shopDetail.shopMenu,
                    )),
          );
        },
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "See All",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }

  reviewsCard(index) {
    var name = "${widget.shopDetail.shopReview[index].byName}";
    var image = "${widget.shopDetail.shopReview[index].byImg}";
    var comments = "${widget.shopDetail.shopReview[index].comments}";
    var rating = "${widget.shopDetail.shopReview[index].value}";
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
                  imageUrl: "$image",
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
                      Expanded(
                        child: Text(
                          "$name",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        child: IconTheme(
                          data: IconThemeData(
                            color: Colors.amber,
                            size: 13,
                          ),
                          child: StarRating(
                            rating:
                                double.tryParse(rating != null ? rating : 0.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  UIHelper.verticalSpace(5),
                  Text(
                    "$comments",
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
