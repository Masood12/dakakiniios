import 'package:cached_network_image/cached_network_image.dart';
import 'package:dakakini/models/user_shop.dart';
import 'package:dakakini/utils/config.dart';
import 'package:flutter/material.dart';

class SeeAllMenu extends StatefulWidget {
  List<ShopMenu> shopMenu;
  SeeAllMenu({this.shopMenu});
  @override
  _SeeAllMenuState createState() => _SeeAllMenuState();
}

class _SeeAllMenuState extends State<SeeAllMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menus"),
        centerTitle: true,
        backgroundColor: colorMain,
      ),
      body: Container(
        child: ListView.builder(
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.shopMenu.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return menuCard(index);
            }),
      ),
    );
  }

  menuCard(index) {
    var title = "${widget.shopMenu[index].title}";
    var desc = "${widget.shopMenu[index].description}";
    var image = "${widget.shopMenu[index].img}";
    var price = "${widget.shopMenu[index].price}";
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
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
}
