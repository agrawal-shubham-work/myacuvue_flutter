import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/widget_methods/WebViews/WebViewContainer.dart';

class PromotionsAndEvents extends StatefulWidget {
  static const String routeName = '/promotions';

  @override
  _PromotionsAndEventsState createState() => _PromotionsAndEventsState();
}

class _PromotionsAndEventsState extends State<PromotionsAndEvents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Promotions and Events'),
      ),
      body: webViewCreate("https://myacuvue.acuvue.com.sg/myacuvue-promo"),
    );
  }
}
