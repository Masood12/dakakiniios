import 'package:cached_network_image/cached_network_image.dart';
import 'package:dakakini/models/user_shop.dart';
import 'package:dakakini/utils/config.dart';
import 'package:dakakini/utils/start_rating.dart';
import 'package:flutter/material.dart';

class SeeAllReviews extends StatefulWidget {
  List<ShopReview> shopReview;
  SeeAllReviews({this.shopReview});
  @override
  _SeeAllReviewsState createState() => _SeeAllReviewsState();
}

class _SeeAllReviewsState extends State<SeeAllReviews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reviews"),
        centerTitle: true,
        backgroundColor: colorMain,
      ),
      body: Container(
        child: ListView.builder(
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: widget.shopReview.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return reviewsCard(index);
            }),
      ),
    );
  }

  reviewsCard(index) {
    var name = "${widget.shopReview[index].byName}";
    var image = "${widget.shopReview[index].byImg}";
    var comments = "${widget.shopReview[index].comments}";
    var rating = "${widget.shopReview[index].value}";
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
