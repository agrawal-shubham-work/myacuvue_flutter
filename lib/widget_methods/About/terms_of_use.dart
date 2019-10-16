import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/widget_methods/WebViews/local_file_web_view.dart';

class TermsOfUse extends StatelessWidget {
  static const String routeName = '/termsofuse';
  @override
  Widget build(BuildContext context) {
    return LocalAssetWebView("Terms of Use", "assets/TermsOfUse.html");
  }
}
