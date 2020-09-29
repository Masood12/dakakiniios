import 'package:cached_network_image/cached_network_image.dart';
import 'package:dakakini/store/get_category_store.dart';
import 'package:dakakini/ui/Shop/Shop.dart';
import 'package:dakakini/utils/config.dart';
import 'package:dakakini/utils/start_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ShopCloths extends StatefulWidget {
  final categoryId;
  GetShopStore getShopStore;
  ShopCloths({this.categoryId, this.getShopStore});
  @override
  _ShopCardState createState() => _ShopCardState();
}

class _ShopCardState extends State<ShopCloths> {
  bool singleLineCard = false;
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (!widget.getShopStore.isClothListLoaded)
        widget.getShopStore.getshopByCatagory(context, widget.categoryId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => widget.getShopStore.isClothListLoaded
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  filterOption(),
                  Expanded(child: shopListView())
                ],
              )
            : Container());
  }

  filterOption() {
    return Container(
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
    );
  }

  shopListView() {
    return GridView.count(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      crossAxisCount: !singleLineCard ? 2 : 1,
      childAspectRatio: !singleLineCard ? 0.7 : 1.4,
      children:
          List.generate(widget.getShopStore.userClothShopModel.data.length, (index) {
        var data = widget.getShopStore.userClothShopModel.data[index];
        return ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Shop()),
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
                          imageUrl: "${data.featureImg}",
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
}
