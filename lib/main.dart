import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/screens/about_me.dart';
import 'package:my_acuvue_flutter/screens/about_myacuvue.dart';
import 'package:my_acuvue_flutter/screens/contact_us.dart';
import 'package:my_acuvue_flutter/screens/membership.dart';
import 'package:my_acuvue_flutter/screens/notification.dart';
import 'package:my_acuvue_flutter/screens/promotions_and_events_web.dart';
import 'package:my_acuvue_flutter/screens/refer_and_earn.dart';
import 'package:my_acuvue_flutter/screens/settings.dart';
import 'screens/home.dart';
import 'screens/eye_care_center_web.dart';
import 'screens/trial.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Theme.of(context).copyWith(
        primaryColor: Color(0xFF013F7C),
      ),
      home: Home(),
      routes: <String, WidgetBuilder>{
        AboutMe.routeName: (BuildContext context) => AboutMe(),
        AboutMyAcuvue.routeName: (BuildContext context) => AboutMyAcuvue(),
        Settings.routeName: (BuildContext context) => Settings(),
        ContactUs.routeName: (BuildContext context) => ContactUs(),
        PromotionsAndEvents.routeName: (BuildContext context) =>
            PromotionsAndEvents(),
        Membership.routeName: (BuildContext context) => Membership(),
        Notifications.routeName: (BuildContext context) => Notifications(),
        ReferAndEarn.routeName: (BuildContext context) => ReferAndEarn(),
        PlaceholderWidget.routeName: (BuildContext contexst) =>
            PlaceholderWidget(Colors.red),
        SplashScreen.routeName: (BuildContext context) => SplashScreen(),
      },
    );
  }
}