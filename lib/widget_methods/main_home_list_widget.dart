import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/widget_methods/main_home_card_barcode_widget.dart';
import 'package:my_acuvue_flutter/widget_methods/main_home_refer_widget.dart';

class MainHomeListView extends StatelessWidget {
  const MainHomeListView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          MainHomeCard(MainHomeBarCodeContainer()),
          MainHomeCard(MainHomeReferWidget()),
        ],
      ),
    );
  }
}

class MainHomeCard extends StatelessWidget {
  final Widget childWidget;

  MainHomeCard(this.childWidget);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      elevation: 8.0,
      child: childWidget,
    );
  }
}
