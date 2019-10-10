import 'package:my_acuvue_flutter/widget_methods/WebViewContainer.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eye Care Center'),
      ),
      body: webViewCreate("https://www.acuvue.com.sg/app/myacuvue-ehc"),
    );
  }
}

/*body: Container(
decoration: BoxDecoration(
image: DecorationImage(
image: AssetImage('images/splash_screen_main.png'),
fit: BoxFit.cover,
colorFilter: ColorFilter.mode(Colors.white, BlendMode.dstATop)),
),
constraints: BoxConstraints.expand(),
),*/
