import 'package:cached_network_image/cached_network_image.dart';
import 'package:dakakini/models/user_shop.dart';
import 'package:dakakini/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationScreen extends StatefulWidget {
  final Datum shopDetail;
  NotificationScreen({this.shopDetail});
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
          itemCount: widget.shopDetail.shopNotification.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return notificationCard(index);
          }),
    );
  }

  notificationCard(index) {
    var title = "${widget.shopDetail.shopNotification[index].title}";
    var body = "${widget.shopDetail.shopNotification[index].body}";
    var dateTime = "${widget.shopDetail.shopNotification[index].dtm}";
    var dateFormated = DateFormat("yyyy-MM-dd").parse(dateTime);
    var date = DateFormat("dd-MMM-yyyy").format(dateFormated);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Icon(
              Icons.notifications,
              color: colorMain,
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
                        "$title",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  UIHelper.verticalSpace(5),
                  Text(
                    "$body",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12, color: smokeyColor),
                  ),
                  Text(
                    "$date",
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
