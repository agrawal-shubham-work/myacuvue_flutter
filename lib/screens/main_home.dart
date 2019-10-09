import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/utilities/image_slider.dart';

class MainHome extends StatefulWidget {
  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[CreateImageSlider()],
      ),
    );
  }
}
