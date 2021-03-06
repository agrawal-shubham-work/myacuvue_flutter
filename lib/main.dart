import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_acuvue_flutter/screens/about_me.dart';
import 'package:my_acuvue_flutter/screens/about_myacuvue.dart';
import 'package:my_acuvue_flutter/screens/contact_us.dart';
import 'package:my_acuvue_flutter/screens/main_map.dart';
import 'package:my_acuvue_flutter/screens/main_store.dart';
import 'package:my_acuvue_flutter/screens/membership.dart';
import 'package:my_acuvue_flutter/screens/notification.dart';
import 'package:my_acuvue_flutter/screens/promotion_bannner.dart';
import 'package:my_acuvue_flutter/screens/promotions_and_events_web.dart';
import 'package:my_acuvue_flutter/screens/refer_and_earn.dart';
import 'package:my_acuvue_flutter/screens/settings.dart';
import 'package:my_acuvue_flutter/screens/splash_screen.dart';
import 'package:my_acuvue_flutter/widget_methods/About/about_my_acuvue.dart';
import 'package:my_acuvue_flutter/widget_methods/About/privacy_policy.dart';
import 'package:my_acuvue_flutter/widget_methods/About/terms_of_use.dart';
import 'package:my_acuvue_flutter/widget_methods/Reward/AcuvueReward/reward%20Slider.dart';
import 'package:my_acuvue_flutter/widget_methods/Reward/LifeStyleReward/life_style_reward.dart';

import 'screens/eye_care_center_web.dart';
import 'screens/home.dart';
import 'screens/trial.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Theme.of(context).copyWith(
        primaryColor: Color(0xFF013F7C),
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'GRABLIGHT'),
        primaryTextTheme: Theme.of(context)
            .textTheme
            .apply(fontFamily: 'GRABBOLD', bodyColor: Colors.white),
        accentTextTheme:
            Theme.of(context).textTheme.apply(fontFamily: 'GRABBOLD'),
      ),
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        SplashScreen.routeName: (BuildContext context) => SplashScreen(),
        MainStore.routeName: (BuildContext context) => MainStore(),
        Home.route: (BuildContext context) => Home("MyACUVUE"),
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
        EyeCareCenter.routeName: (BuildContext context) => EyeCareCenter(),
        PromotionBanner.routeName: (BuildContext context) => PromotionBanner(),
        MainMap.routeName: (BuildContext context) => MainMap(),
        RewardsSlider.routeName: (BuildContext context) =>
            RewardsSlider("images/promotions1.jpg", "\$20", "2000"),
        TermsOfUse.routeName: (BuildContext context) => TermsOfUse(),
        AboutMyACUVUE.routeName: (BuildContext context) => AboutMyACUVUE(),
        PrivacyPolicy.routeName: (BuildContext context) => PrivacyPolicy(),
        LifeStyleReward.routeName: (BuildContext context) => LifeStyleReward(),
      },
    );
  }
}
