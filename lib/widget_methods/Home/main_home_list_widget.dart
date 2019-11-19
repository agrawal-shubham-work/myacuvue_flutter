import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/screens/refer_and_earn.dart';
import 'package:my_acuvue_flutter/widget_methods/Home/main_home_card_barcode_widget.dart';
import 'package:my_acuvue_flutter/widget_methods/Home/main_home_refer_widget.dart';

class MainHomeListView extends StatefulWidget {
  const MainHomeListView({
    Key key,
  }) : super(key: key);

  @override
  _MainHomeListViewState createState() => _MainHomeListViewState();
}

class _MainHomeListViewState extends State<MainHomeListView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          MainHomeCard(MainHomeBarCodeContainer()),
          MainHomeCard(MainHomeReferWidget(() {
            Navigator.of(context).pushNamed(ReferAndEarn.routeName);
          })),
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
