import 'package:dakakini/ui/HomeScreen.dart';
import 'package:dakakini/ui/LoginScreen.dart';
import 'package:dakakini/ui/Shop/ShopContactScreen.dart';
import 'package:dakakini/ui/Shop/ShopProfile.dart';
import 'package:dakakini/ui/Shop/ShopScreen.dart';
import 'package:dakakini/ui/Shop/create_shop.dart';
import 'package:dakakini/ui/Shop/create_shop_menu.dart';
import 'package:dakakini/ui/SplashScreen.dart';
import 'package:dakakini/ui/change_password_screen.dart';
import 'package:dakakini/ui/forget_password.dart';
import 'package:dakakini/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: colorMain, // Color for Android
        statusBarBrightness:
            Brightness.light, // Dark == white status bar -- for IOS.
        statusBarIconBrightness: Brightness.light));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dakakini',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}
