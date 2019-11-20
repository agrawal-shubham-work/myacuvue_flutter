import 'package:firebase_auth/firebase_auth.dart';
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
import 'package:my_acuvue_flutter/screens/splash_screen.dart';

class getDrawer extends StatefulWidget {
  final BuildContext context;

  getDrawer(this.context);

  @override
  _getDrawerState createState() => _getDrawerState();
}

class _getDrawerState extends State<getDrawer> {
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
            if (s == 'Logout') {
              FirebaseAuth.instance.signOut();
            }
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed(routeName);
          });
        },
      );
    }

    var myNavChildren = [
      getNavItem(Icons.face, "My Profile", AboutMe.routeName),
      getNavItem(
          Icons.remove_red_eye, "Eye Care Center", EyeCareCenter.routeName),
      getNavItem(
          Icons.home, "Promotion and Events", PromotionsAndEvents.routeName),
      getNavItem(Icons.attach_money, "Refer and Earn", ReferAndEarn.routeName),
      getNavItem(Icons.card_giftcard, "Membership", Membership.routeName),
      getNavItem(Icons.home, "About MyAcuvue", AboutMyAcuvue.routeName),
      getNavItem(Icons.settings, "Settings", Settings.routeName),
      getNavItem(Icons.notifications, "Notifications", Notifications.routeName),
      getNavItem(Icons.contact_phone, "Contact us", ContactUs.routeName),
      getNavItem(Icons.exit_to_app, "Logout", SplashScreen.routeName),
    ];

    ListView listView = ListView(children: myNavChildren);

    return Drawer(
      child: listView,
    );
  }

  @override
  Widget build(BuildContext context) {
    return getNavDrawer(widget.context);
  }
}
