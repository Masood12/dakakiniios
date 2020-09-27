import 'package:cached_network_image/cached_network_image.dart';
import 'package:dakakini/utils/config.dart';
import 'package:flutter/material.dart';

class SeeAllMenu extends StatefulWidget {
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
            itemCount: 3,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return menuCard();
            }),
      ),
    );
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
}
