import 'package:my_acuvue_flutter/widget_methods/WebViews/WebViewContainer.dart';
import 'package:flutter/material.dart';

class EyeCareCenter extends StatefulWidget {
  static const String routeName = '/eyecare';
  @override
  _EyeCareCenterState createState() => _EyeCareCenterState();
}

class _EyeCareCenterState extends State<EyeCareCenter> {
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
