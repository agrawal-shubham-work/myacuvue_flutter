import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/widget_methods/WebViews/local_file_web_view.dart';

class AboutMyACUVUE extends StatelessWidget {
  static const String routeName = '/about2myacuvue';
  @override
  Widget build(BuildContext context) {
    return LocalAssetWebView("About MyACUVUE", "assets/AboutMyACUVUE.html");
  }
}
