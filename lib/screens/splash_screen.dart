import 'package:my_acuvue_flutter/utilities/WebViewContainer.dart';
import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/utilities/home_drawer.dart';

class SplashScreen extends StatefulWidget {
  static const String route = '/';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google'),
      ),
      drawer: AppDrawer(),
      body: webViewCreate("https://google.com"),
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
