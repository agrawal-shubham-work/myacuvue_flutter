import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/widget_methods/WebViews/WebViewContainer.dart';

class TermsOfUse extends StatelessWidget {
  static const String routeName = '/termsofuse';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms of Use'),
      ),
      body: webViewCreate("assets/TermsOfUse.html"),
    );
  }
}
