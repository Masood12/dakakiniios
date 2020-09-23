import 'dart:async';
import 'package:dakakini/ui/HomeScreen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isIntroViewed = false;
  bool isUserLoggedIn = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

//    Timer(
//        Duration(seconds: 2),
//        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
//                builder: (BuildContext context) => HomeScreen())));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width ;
    double height = MediaQuery.of(context).size.height / 15;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
         color: Colors.white,
          width: width,
          child: Column(
            children: <Widget>[
              Expanded(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        //  SizedBox(height: 25,),
                        SizedBox(
                          height: 220,
                          child: Image.asset(
                            'assets/logo.png',
                          ),
                        ),

                        // Image.asset('assets/brokershub.png')
                      ],
                    ),
                  )),
             // Expanded(flex: 2, child: bottomBarTextCopyright()),

            ],
          ),
        ),
      ),
    );
  }
}
