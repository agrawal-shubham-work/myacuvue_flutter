import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/utilities/constants.dart';
import 'package:my_acuvue_flutter/widget_methods/para_style_widget.dart';

class MainHomeBarCodeContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(mHomeCardHeading, style: kHomeHeading),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey.shade200),
                ),
              ),
              child: PrivacyParaWidget(mHomeCardSubHeading, kHomeSubHeading),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              width: 250.0,
              height: 50.0,
              child: Image.asset(
                "images/barcode.png",
                fit: BoxFit.fitWidth,
              ),
            ),
            PrivacyParaWidget('SGP4c-C1743L', kHomeSubHeading),
          ],
        ));
  }
}
