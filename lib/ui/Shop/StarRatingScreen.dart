import 'dart:async';

import 'package:dakakini/utils/config.dart';
import 'package:dakakini/utils/start_rating.dart';
import 'package:flutter/material.dart';
import 'package:dakakini/models/user_shop.dart';
import 'package:dakakini/store/get_category_store.dart';

class RatingScreen extends StatefulWidget {
  final Datum shopDetail;
  GetShopStore getShopStore;

  RatingScreen({this.shopDetail, @required this.getShopStore});
  @override
  _RatingScreenState createState() => _RatingScreenState();
}

class _RatingScreenState extends State<RatingScreen> {
  double rating = 0.0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          commentsDescription(width),
          starRating(),
          singUpBotton()
        ],
      ),
    );
  }

  commentsDescription(width) {
    return Container(
      width: width,
      child: TextField(
        maxLines: 7,
        style: TextStyle(fontSize: 12),
        onChanged: (value) => widget.getShopStore.comments = value,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintStyle: TextStyle(fontSize: 12, color: Colors.black),
            hintText: 'Type your comments here',
            contentPadding: EdgeInsets.all(10.0),
            labelStyle:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(const Radius.circular(10.0)),
                borderSide: BorderSide(color: colorMain, width: 1.0)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: colorMain, width: 1.0),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: colorMain, width: 1.0),
            )),
      ),
    );
  }

  starRating() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: <Widget>[
          Spacer(),
          StarRating(
            rating: rating,
            color: colorMain,
            size: 35,
            onRatingChanged: (rating) {
              setState(() {
                this.rating = rating;
                widget.getShopStore.ratingValue = rating.toInt();
              });
            },
          ),
          Spacer(),
        ],
      ),
    );
  }

  singUpBotton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: RaisedButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.0)),
          color: colorMain,
          textColor: Colors.white,
          child: Text("Submit Review"),
          onPressed: () {
            widget.getShopStore.toID = widget.shopDetail.shopId.toString();
            widget.getShopStore.review(context);
            //  store.validate(context);
          }),
    );
  }
}
