import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

const smallAppBar = 60.0;
const BigAppBar = 120.0;
const colorMain = Color(0xffBB872C);
const ratingColor = Color(0xffFD4F1C);
const colorDivider = Color(0xffE1E1E1);
const colorIconDefault = Color(0xffD1D1D1);
const colorGrey = Colors.grey;
const halfWhite = Color(0xffEFEFEF);
const lighrgrey = Color(0xFF837676);
const lightTxtColor = Color(0xFFD1D1D1);
const hintText = Colors.black;
var disabledButtonColor = Color(0xff52598E);
const subHeadingFontSize = 12.0;
const headingFontSize = 22.0;
const buttonFontSize = 14.0;
const height40 = 40.0;
const suffixIconSize = 18.0;
const prefixIconSize = 20.0;
const drawerListColor = Color(0xffFBFBFB);
const ratingcolor = Color(0xff99cb0a);
const underLineColor = colorMain;

Color blue = const Color(0xFF2a2861);
Color orange = const Color(0xFFfb876e);
Color fontBlack = const Color(0xFF464648);
Color fontOrange = const Color(0xFFeb421b);
Color gradientStart = const Color(0xFF4c41a3);
Color gradientEnd = const Color(0xFF1f176f);
Color buttonLightBlue = const Color(0xFF5c51b2);
Color percentageOrange = const Color(0xFFf49475);
Color lsBLUE = const Color(0xFF453b9b);
Color greyColorLabel = const Color(0xFFb5b5b6);
Color greyColorAppBar = const Color(0xFFeeeef0);
Color appbarTextclr = const Color(0xFF4a426f);
Color tabBarUNFOCUSclr = const Color(0xFF9e99c8);
Color headingsLight = const Color(0xFF888888);
Color cardLgrey = const Color(0xFFf5f5f5);
Color green = const Color(0xFF17c228);
Color dismisTxtClr = const Color(0xFFf49475);
Color starColor = const Color(0xFFffaa00);
Color pricTagColor = const Color(0xFFef8f79);
Color hyperLinkColor = const Color(0xFF3947dc);
Color radioBTnClr = const Color(0xFFeb5d3b);
Color searchBtnClr = const Color(0xFF5d5781);

const technicalErrorMessage =
    "Something went wrong please contact system administrator";
const colorLoadingRed = Color(0xffC40B0B);
const colorLoadingLightBlue = Color(0xff5592F8);
const colorLoadingBlue = Color(0xff29316C);
const colorExpandableFill = Color(0xffF4F4F4);
const bold = TextStyle(fontWeight: FontWeight.bold);
const link = TextStyle(color: Color(0xFF3F729B));
const smokeyColor = Color(0xff808080);
const smokeybgColor = Color(0xffEFEFEF);
var imgUrl, currentUserNameValue, currentUserEmailValue;

// Colos that use in our app
const kSecondaryColor = Color(0xFFFE6D8E);
const kTextColor = Color(0xFF12153D);
const kTextLightColor = Color(0xFF9A9BB2);
const kFillStarColor = Color(0xFFFCC419);

const kDefaultPadding = 20.0;

const kDefaultShadow = BoxShadow(
  offset: Offset(0, 4),
  blurRadius: 4,
  color: Colors.black26,
);

const String about_us =
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum';

const Map<int, String> monthsInYear = {
  1: "Jan",
  2: "Feb",
  3: "Mar",
  4: "Apr",
  5: "May",
  6: "Jun",
  7: "Jul",
  8: "Aug",
  9: "Sept",
  10: "Oct",
  11: "Nov",
  12: "Dec",
};

showToast(msg, error) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: error == true ? Colors.red : Colors.green,
      textColor: error == true ? Colors.white : Colors.black,
      fontSize: 16.0);
}

//showLongPressDialog(BuildContext context) {
//  return showDialog(
//    context: context,
//    builder: (BuildContext context) {
//      return SideMenuLongPressDialog();
//    },
//  );
//}

dummyMoreFilterImger(contxt, isLodading) {
  return Container(
    height: 60,
    width: 60,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(60.0),
      child: Image.asset(
        'assets/no_img.png',
        color: colorIconDefault,
      ),
    ),
  );
}

dummyCoverImage(context, isLoading) {
  return Container(
      color: colorDivider,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            isLoading ? "Loading..." : "No Image",
            style: TextStyle(fontSize: 18.0, letterSpacing: 1.0),
          ),
          SizedBox(
            height: 10,
          ),
          RichText(
            text: new TextSpan(
              // Note: Styles for TextSpans must be explicitly defined.
              // Child text spans will inherit styles from parent
              style: new TextStyle(
                fontSize: 12.0,
                color: Colors.black,
              ),
              children: <TextSpan>[
                new TextSpan(
                    text: 'Copyright © 2020 ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                new TextSpan(
                    text: 'Brokers Circle',
                    style: new TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Text(
            "www.brokerscircle.net",
            style: TextStyle(fontSize: 12.0),
          ),
        ],
      ));
}

dummyDeveloperImage(context, isLoading) {
  return Container(
      color: colorDivider,
      width: 60,
      height: 60,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            isLoading ? "Loading..." : "No Image",
            style: TextStyle(fontSize: 14.0, letterSpacing: 1.0),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            "www.brokerscircle.net",
            style: TextStyle(fontSize: 12.0),
          ),
        ],
      ));
}

bottomBarTextCopyright({color}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        RichText(
          text: new TextSpan(
            // Note: Styles for TextSpans must be explicitly defined.
            // Child text spans will inherit styles from parent
            style: new TextStyle(
              fontSize: 12.0,
              color: color == null ? Colors.black : color,
            ),
            children: <TextSpan>[
              new TextSpan(
                  text: 'Copyright © 2020 ',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              new TextSpan(
                  text: 'Brokers Circle',
                  style: new TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        Text(
          "www.brokerscircle.net",
          style: TextStyle(
              fontSize: 12.0, color: color == null ? Colors.black : color),
        ),
        Padding(padding: EdgeInsets.all(5.0))
      ],
    ),
  );
}

topBackgroungImage(height) {
  return Container(
    width: double.infinity,
    height: height,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/blueimg.png'),
        fit: BoxFit.fill,
      ),
    ),
  );
}

backgroundImage() {
  return Positioned.fill(
    child: Align(
      alignment: Alignment.bottomCenter,
      child: Image.asset(
        "assets/building.png",
      ),
    ),
  );
}

String truncateWithEllipsis(int cutoff, String myString) {
  return (myString.length <= cutoff)
      ? myString
      : '${myString.substring(0, cutoff)}...';
}

setColor(String title) {
  if (title == 'For Sale') {
    return colorMain;
  } else if (title == 'For Rent') {
    return Colors.yellow;
  } else if (title == 'For Wanted') {
    return Colors.red;
  } else if (title == 'Off Plan') {
    return Colors.green;
  } else {
    return Colors.red;
  }
}

void showSnackbar(BuildContext context, String text) {
  Scaffold.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      duration: Duration(seconds: 1),
    ),
  );
}

fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}

//
//computeTimeAndDate(dateAndTime) {
//  var computedTime;
//  if ((DateTime.now().month == dateAndTime.month) &&
//      (DateTime.now().year == dateAndTime.year))
//    computedTime = timeago.format(
//        DateTime.now().subtract(Duration(
//            minutes: dateAndTime.minute,
//            seconds: dateAndTime.second,
//            hours: dateAndTime.hour)),
//        locale: 'en');
//  else
//    computedTime = DateTimeUtils.getFullDate(dateAndTime).toString();
//  return computedTime;
//}
//
class Config {
  static Future<bool> getIntroScreenViewed() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('introScreen');
  }

  static isIntroScreenViewed(bool introScreen) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('introScreen', introScreen);
  }

  static Future<String> getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userName');
  }

  static setUserName(String userName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    currentUserNameValue = userName;
    prefs.setString('userName', userName);
  }

  static Future<String> getUserEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userEmail');
  }

  static setUserEmail(String userEmail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    currentUserEmailValue = userEmail;
    prefs.setString('userEmail', userEmail);
  }

  static Future<String> getUserProfilePicture() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userProfilePicture');
  }

  static setUserProfilePicture(String userProfilePicture) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userProfilePicture', userProfilePicture);
  }

  static Future<int> getUserID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('userID');
  }

  static setUserID(int userID) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('userID', userID);
  }

  static Future<int> getUserType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('userType');
  }

  static setUserType(int companyID) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('userType', companyID);
  }

  static Future<String> getBasicImageUrl() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('imageURL');
  }

  static setBasicImageUrl(String imageURL) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('imageURL', imageURL);
  }

  static Future<String> getUserDisplayName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('displayName');
  }

  static setUserDisplayName(String displayName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('displayName', displayName);
  }

  static Future<String> getUserMobile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userMobile');
  }

  static setUserMobile(String userMobile) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userMobile', userMobile);
  }

  static Future<String> getUserCompanyName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userCompanyName');
  }

  static setUserCompanyName(String userCompanyName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userCompanyName', userCompanyName);
  }

  static Future<bool> getrememberme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('rememberme');
  }

  static setRememberMe(bool rememberme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('rememberme', false);
  }

  static Future<String> getDateForShowingDialog() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('Lastdate');
  }

  static setDateForShowingDialog(String lastdate) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('Lastdate', lastdate);
  }

  static clearSharePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("userName");
  }
}

class UIHelper {
  static Widget verticalSpace([double height = 8]) {
    return SizedBox(height: height);
  }

  static Widget horizontalSpace([double width = 8]) {
    return SizedBox(width: width);
  }
}

noImageAvailable({height, width}) {
  return Container(
    color: Color(0xffd8d6d9),
    child: Image.asset(
      "assets/no_image.png",
      height: height,
      width: width,
    ),
  );
}
