import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/utilities/constants.dart';
import 'package:my_acuvue_flutter/widget_methods/para_style_widget.dart';

class MainHomeReferWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 8.0),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(mHomeReferCardHeading, style: kHomeReferHeading),
            ),
            PrivacyParaWidget(mHomeReferCardSubHeading, kHomeSubHeading),
            Container(
              decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(5.0)),
              margin: EdgeInsets.all(10.0),
              child: FlatButton(
                child: Center(
                    child: Text(
                  "Explore",
                  style: TextStyle(color: Colors.white, fontSize: 14.0),
                )),
              ),
            ),
          ],
        ));
  }
}
