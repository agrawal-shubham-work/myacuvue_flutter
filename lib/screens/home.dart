import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/screens/about_me.dart';
import 'package:my_acuvue_flutter/screens/about_myacuvue.dart';
import 'package:my_acuvue_flutter/screens/contact_us.dart';
import 'package:my_acuvue_flutter/screens/eye_care_center_web.dart';
import 'package:my_acuvue_flutter/screens/membership.dart';
import 'package:my_acuvue_flutter/screens/notification.dart';
import 'package:my_acuvue_flutter/screens/promotions_and_events_web.dart';
import 'package:my_acuvue_flutter/screens/refer_and_earn.dart';
import 'package:my_acuvue_flutter/screens/settings.dart';
import 'package:my_acuvue_flutter/utilities/constants.dart';
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
    PlaceholderWidget(Colors.green),
    PlaceholderWidget(Colors.orange),
    PlaceholderWidget(Colors.blue),
    PlaceholderWidget(Colors.redAccent)
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
        title: Text("MyAcuvue"),
      ),
      body: tabs[currentTabIndex],
      drawer: SafeArea(child: getNavDrawer(context)),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }
}
