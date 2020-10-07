import 'package:cached_network_image/cached_network_image.dart';
import 'package:dakakini/models/user_shop.dart';
import 'package:dakakini/ui/Shop/ShoEditProfile.dart';
import 'package:dakakini/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
//import 'package:flutter_svg/svg.dart';

class ProfileScreen extends StatefulWidget {
  final Datum shopDetail;
  ProfileScreen({this.shopDetail});
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      child: SingleChildScrollView(
          child: Stack(
        children: <Widget>[
          _coverImg(screenSize),
          Column(
            children: <Widget>[
              SizedBox(
                height: screenSize.height / 8.5,
              ),
              _profileImg(),
              // _fullName(),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    children: <Widget>[
                      shopTimmings(),
                      shopCountry(),
                      shopCity(),
                      shopAddress(),
                      shopContactNumber(),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    children: <Widget>[
                      changePassword(),
                    ],
                  ),
                ),
              ),

              editProfileButton(),
            ],
          )
        ],
      )),
    );
  }

  Widget _coverImg(Size screensize) {
    return Stack(
      children: <Widget>[
        Container(
          height: screensize.height / 5,
          color: colorMain,
        ),
      ],
    );
  }

  Widget _profileImg() {
    return Center(
        child: Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width / 1.1,
          height: 144,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(7))),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${widget.shopDetail.ownerInfo.name}',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  '${widget.shopDetail.ownerInfo.email}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }

  Widget shopTimmings() {
    return Padding(
      padding:
          const EdgeInsets.only(top: 10.0, bottom: 10, left: 15.0, right: 15.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/no_image.png')))),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Shop Timings',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        '${widget.shopDetail.shopDetail.openAt.hour}:${widget.shopDetail.shopDetail.openAt.minute}:${widget.shopDetail.shopDetail.openAt.second} - ${widget.shopDetail.shopDetail.closeAt.hour}:${widget.shopDetail.shopDetail.closeAt.minute}:${widget.shopDetail.shopDetail.closeAt.second}',
                        style: TextStyle(fontSize: 12.0),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget shopCountry() {
    return Padding(
      padding:
          const EdgeInsets.only(top: 10.0, bottom: 10, left: 15.0, right: 15.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/no_image.png')))),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Shop Country',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        '${widget.shopDetail.countryTitle}',
                        style: TextStyle(fontSize: 12.0),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget shopCity() {
    return Padding(
      padding:
          const EdgeInsets.only(top: 10.0, bottom: 10, left: 15.0, right: 15.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/no_image.png')))),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Shop City',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        '${widget.shopDetail.cityTitle}',
                        style: TextStyle(fontSize: 12.0),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget shopContactNumber() {
    return Padding(
      padding:
          const EdgeInsets.only(top: 10.0, bottom: 10, left: 15.0, right: 15.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/no_image.png')))),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Shop Contact Number',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        '${widget.shopDetail.shopDetail.phone}',
                        style: TextStyle(fontSize: 12.0),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget shopAddress() {
    return Padding(
      padding:
          const EdgeInsets.only(top: 10.0, bottom: 10, left: 15.0, right: 15.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/no_image.png')))),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Shop Address',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        '${widget.shopDetail.shopLocation[0].address}',
                        style: TextStyle(fontSize: 12.0),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget changePassword() {
    return Padding(
      padding:
          const EdgeInsets.only(top: 10.0, bottom: 10, left: 15.0, right: 15.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/no_image.png')))),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Change Password',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        'Tap here to change password',
                        style: TextStyle(fontSize: 12.0),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  editProfileButton() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0)),
            color: colorMain,
            textColor: Colors.white,
            child: Text("Edit Profile"),
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => EditProfileScrren()));
              // store.validate(context);
            }),
      ),
    );
  }
}
