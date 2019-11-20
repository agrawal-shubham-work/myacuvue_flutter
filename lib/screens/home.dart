import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/screens/main_home.dart';
import 'package:my_acuvue_flutter/screens/main_points.dart';
import 'package:my_acuvue_flutter/screens/main_reward.dart';
import 'package:my_acuvue_flutter/screens/main_store.dart';
import 'package:my_acuvue_flutter/screens/store_cart.dart';
import 'package:my_acuvue_flutter/utilities/constants.dart';
import 'package:my_acuvue_flutter/utilities/get_current_user_id.dart';
import 'package:my_acuvue_flutter/utilities/global_variable.dart';
import 'package:my_acuvue_flutter/utilities/navigation_drawer.dart';

class Home extends StatefulWidget {
  String title;

  Home(this.title);

  static const String route = '/home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String userId;

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      onTap: onTapped,
      currentIndex: currentTabIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Color(0xFF0137FC),
          ),
          title: Text(
            "Home",
            style: kDrawerTextStyle,
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.star_border,
            color: Color(0xFF0137FC),
          ),
          title: Text(
            "Points",
            style: kDrawerTextStyle,
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.attach_money,
            color: Color(0xFF0137FC),
          ),
          title: Text(
            "Rewards",
            style: kDrawerTextStyle,
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.store,
            color: Color(0xFF0137FC),
          ),
          title: Text(
            "Store",
            style: kDrawerTextStyle,
          ),
        )
      ],
    );
  }

  int currentTabIndex = 0;

  List<Widget> tabs = [
    MainHome(),
    Points(),
    MainReward(ScreenSelected.Wallet),
    MainStore()
  ];

  onTapped(int index) {
    setState(() {
      currentTabIndex = index;
      switch (index) {
        case 0:
          widget.title = "MyACUVUE";
          break;
        case 1:
          widget.title = "Points";
          break;
        case 2:
          widget.title = "Rewards";
          break;
        case 3:
          widget.title = "Register Store";
          break;
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    inputData().then((user) {
      userId = user;
      GlobalVariable.userId = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: 40.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => Cart(userId),
                    ),
                  );
                },
                child: Stack(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                    ),
                    GlobalVariable.lifeStyleRewardList.length == 0
                        ? Container()
                        : Positioned(
                            child: Stack(
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Icon(Icons.brightness_1,
                                      size: 20.0, color: Colors.green[800]),
                                ),
                                Positioned(
                                  top: 3.0,
                                  right: 5.0,
                                  child: Center(
                                    child: Text(
                                      GlobalVariable.lifeStyleRewardList.length
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: tabs[currentTabIndex],
      drawer: SafeArea(child: getDrawer(context)),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }
}
