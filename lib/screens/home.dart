import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/screens/about_me.dart';
import 'package:my_acuvue_flutter/screens/about_myacuvue.dart';
import 'package:my_acuvue_flutter/screens/contact_us.dart';
import 'package:my_acuvue_flutter/screens/eye_care_center_web.dart';
import 'package:my_acuvue_flutter/screens/main_home.dart';
import 'package:my_acuvue_flutter/screens/main_reward.dart';
import 'package:my_acuvue_flutter/screens/main_store.dart';
import 'package:my_acuvue_flutter/screens/membership.dart';
import 'package:my_acuvue_flutter/screens/notification.dart';
import 'package:my_acuvue_flutter/screens/promotions_and_events_web.dart';
import 'package:my_acuvue_flutter/screens/refer_and_earn.dart';
import 'package:my_acuvue_flutter/screens/settings.dart';
import 'package:my_acuvue_flutter/screens/store_cart.dart';
import 'package:my_acuvue_flutter/utilities/constants.dart';
import 'package:my_acuvue_flutter/utilities/global_variable.dart';
import 'trial.dart';

class Home extends StatefulWidget {
  static const String route = '/home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Drawer getNavDrawer(BuildContext context) {
    GestureDetector getNavItem(var icon, String s, String routeName) {
      return GestureDetector(
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey.shade500),
            ),
          ),
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: <Widget>[
              Icon(
                icon,
                color: Color(0xFF013F7C),
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                s,
                style: TextStyle(color: Color(0xFF013F7C)),
              )
            ],
          ),
        ),
        onTap: () {
          setState(() {
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed(routeName);
          });
        },
      );
    }

    var myNavChildren = [
      getNavItem(Icons.face, "My Profile", AboutMe.routeName),
      getNavItem(
          Icons.remove_red_eye, "Eye Care Center", SplashScreen.routeName),
      getNavItem(
          Icons.home, "Promotion and Events", PromotionsAndEvents.routeName),
      getNavItem(Icons.attach_money, "Refer and Earn", ReferAndEarn.routeName),
      getNavItem(Icons.card_giftcard, "Membership", Membership.routeName),
      getNavItem(Icons.home, "About MyAcuvue", AboutMyAcuvue.routeName),
      getNavItem(Icons.settings, "Settings", Settings.routeName),
      getNavItem(Icons.notifications, "Notifications", Notifications.routeName),
      getNavItem(Icons.contact_phone, "Contact us", ContactUs.routeName),
    ];

    ListView listView = ListView(children: myNavChildren);

    return Drawer(
      child: listView,
    );
  }

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
    PlaceholderWidget(Colors.orange),
    MainReward(),
    MainStore()
  ];
  onTapped(int index) {
    setState(() {
      currentTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyAcuvue™"),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: 40.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => Cart(),
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
      drawer: SafeArea(child: getNavDrawer(context)),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }
}
