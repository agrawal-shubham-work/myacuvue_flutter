import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/widget_methods/Home/image_slider.dart';
import 'package:my_acuvue_flutter/widget_methods/Home/main_home_list_widget.dart';

class MainHome extends StatefulWidget {
  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          CreateImageSlider(),
          MainHomeListView(),
        ],
      ),
    );
  }
}
