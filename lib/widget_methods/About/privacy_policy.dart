import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/widget_methods/WebViews/local_file_web_view.dart';

class PrivacyPolicy extends StatelessWidget {
  static const String routeName = '/privacypolicy';

  @override
  Widget build(BuildContext context) {
    return LocalAssetWebView("Privacy Policy", "assets/PrivacyPolicy.html");
  }
}
