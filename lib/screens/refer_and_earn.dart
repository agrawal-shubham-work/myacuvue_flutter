import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/utilities/constants.dart';
import 'package:my_acuvue_flutter/widget_methods/para_style_widget.dart';
import 'package:my_acuvue_flutter/widget_methods/background_image_widget.dart';

class ReferAndEarn extends StatefulWidget {
  static const String routeName = '/refer';
  @override
  _ReferAndEarnState createState() => _ReferAndEarnState();
}

class _ReferAndEarnState extends State<ReferAndEarn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Refer and Earn'),
      ),
      body: Stack(
        children: <Widget>[
          BackgroundImage("images/referral.jpg"),
          Container(
            width: double.infinity,
            height: double.infinity,
            margin: EdgeInsets.only(left: 34.0, right: 34.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                PrivacyParaWidget('Refer a friend', kPrivacyHeading),
                Text(
                  mReferSubHeading,
                  style: kReferPara,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    mReferSubPara,
                    style: kReferSubPara,
                  ),
                ),
                Container(
                  color: Color(0xFf013F7C),
                  margin: EdgeInsets.only(top: 40.0),
                  child: FlatButton(
                    child: Text(
                      'INVITE FRIEND',
                      style: kReferBtn,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
