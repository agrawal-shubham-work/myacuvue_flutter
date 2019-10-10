import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/utilities/constants.dart';
import 'package:my_acuvue_flutter/widget_methods/para_style_widget.dart';

class MainStore extends StatefulWidget {
  @override
  _MainStoreState createState() => _MainStoreState();
}

class _MainStoreState extends State<MainStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.asset("images/add_ecp_normal.png"),
            ),
            PrivacyParaWidget('Select ECP', kStoreHeading),
            Text(
              mStorePara,
              style: kStoreSubHeading,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
