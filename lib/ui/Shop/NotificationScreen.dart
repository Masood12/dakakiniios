import 'package:cached_network_image/cached_network_image.dart';
import 'package:dakakini/utils/config.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 3,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return notificationCard();
          }),
    );
  }

  notificationCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.notifications,
              color: colorMain,
            ),
            // ClipRRect(
            //   borderRadius: BorderRadius.all(Radius.circular(100.0)),
            //   child: CachedNetworkImage(
            //       height: 50,
            //       width: 50,
            //       fit: BoxFit.fill,
            //       imageUrl: "https://img.icons8.com/plasticine/2x/user.png",
            //       placeholder: (context, url) =>
            //           noImageAvailable(height: 50.0, width: 50.0),
            //       errorWidget: (context, url, error) =>
            //           noImageAvailable(height: 50.0, width: 50.0)),
            // ),
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
