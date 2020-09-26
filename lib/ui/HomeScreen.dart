import 'package:cached_network_image/cached_network_image.dart';
import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';
import 'package:dakakini/ui/ShopScreen.dart';
import 'package:dakakini/utils/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent,
        unselectedWidgetColor: Colors.black,accentColor:colorMain);
    return Scaffold(
      key: _drawerKey, // assign key to Scaffold

      drawer: Drawer(
    child: ListView(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height / 3.5,
          child: DrawerHeader(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(2.0)),
                  Image.asset(
                    'assets/logo.png',
                    height: 200,
                    width: 200,
                  ),
                ],
              ),
            ),

          ),
        ),

      Padding(
        padding: const EdgeInsets.only(left:15.0,right: 15),
        child: ConfigurableExpansionTile(
          animatedWidgetFollowingHeader: const Icon(
            Icons.expand_more,
            color: const Color(0xFF707070),
          ),
          header: Expanded(child: Text('UAE',style: TextStyle(fontSize: 15,color: colorMain,fontWeight: FontWeight.w600),)),
          children: [
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return  Padding(
                  padding: const EdgeInsets.only(left:2.0),
                  child: Padding(
                    padding: const EdgeInsets.only(top:4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            width: 28.0,
                            height: 28.0,
                            decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                    fit: BoxFit.fill,
                                    image:AssetImage('assets/no_image.png')
                                )
                            )),
                        SizedBox(width: 5,),
                        Text('Dubai',style: TextStyle(
                            color: Colors.black,
                            fontSize: 12
                        ),),
                      ],
                    ),
                  ),
                );
              },
              itemCount: 5,),
            // + more params, see example !!
          ],
        ),
      ),
        Padding(
          padding: const EdgeInsets.only(left:15.0,right: 15,top: 10),
          child: ConfigurableExpansionTile(
            animatedWidgetFollowingHeader: const Icon(
              Icons.expand_more,
              color: const Color(0xFF707070),
            ),
            header: Expanded(child: Text('Change Language',style: TextStyle(fontSize: 15,color: colorMain,fontWeight: FontWeight.w600),)),
            children: [
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return  Padding(
                    padding: const EdgeInsets.only(left:2.0),
                    child: Padding(
                      padding: const EdgeInsets.only(top:4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              width: 28.0,
                              height: 28.0,
                              decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: new DecorationImage(
                                      fit: BoxFit.fill,
                                      image:AssetImage('assets/no_image.png')
                                  )
                              )),
                          SizedBox(width: 5,),
                          Text('English',style: TextStyle(
                              color: Colors.black,
                              fontSize: 12
                          ),),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: 5,),
              // + more params, see example !!
            ],
          ),
        ),
      ],
    ),
  ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: colorMain,
        leading: GestureDetector(
          onTap: ()=>_drawerKey.currentState.openDrawer(),
            child: Icon(Icons.menu)),
        title:Text("Home Screen") ,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context) => ShopSearch()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom:18.0),
                    child: Text("FOOD & SWEETS",style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w600
                    ),),
                  ),
                ),
                  decoration: new BoxDecoration(
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image:AssetImage('assets/food_sweets.jpg')
                      )
                  )
              ),
            ),

          ),

          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context) => ShopSearch()));
              },
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom:18.0),
                      child: Text("CLOTHES & ACCESSORIES",style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600
                      ),),
                    ),
                  ),
                  decoration: new BoxDecoration(
                      image: new DecorationImage(
                          fit: BoxFit.fill,

                          image:AssetImage('assets/cloths.jpg')
                      )
                  )
              ),
            ),

          ),
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context) => ShopSearch()));
              },
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom:18.0),
                      child: Text("OUD & BAKHOOR",style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600
                      ),),
                    ),
                  ),
                  decoration: new BoxDecoration(
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image:AssetImage('assets/bakhoor.jpg')
                      )
                  )
              ),
            ),

          ),
        ],
      ),
    );
  }
}
