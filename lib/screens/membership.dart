import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/widget_methods/Membership/membership_regular.dart';
import 'package:my_acuvue_flutter/widget_methods/Membership/vip_page.dart';
import 'package:my_acuvue_flutter/widget_methods/Reward/reward_btn_widget.dart';
import 'package:my_acuvue_flutter/utilities/constants.dart';

class Membership extends StatefulWidget {
  static const String routeName = '/membership';
  @override
  _MembershipState createState() => _MembershipState();
}

enum MembershipType {
  VIP,
  REGULAR,
}

class _MembershipState extends State<Membership> {
  MembershipType membership = MembershipType.VIP;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Membership'),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                membership == MembershipType.VIP
                    ? RewardBtnWidget('VIP', darkBlueColor, () {
                        setSelectedState(MembershipType.VIP);
                      })
                    : RewardBtnWidget('VIP', lightRegularColor, () {
                        setSelectedState(MembershipType.VIP);
                      }),
                membership == MembershipType.REGULAR
                    ? RewardBtnWidget('Membership', darkBlueColor, () {
                        setSelectedState(MembershipType.REGULAR);
                      })
                    : RewardBtnWidget('Membership', lightRegularColor, () {
                        setSelectedState(MembershipType.REGULAR);
                      }),
              ],
            ),
            Expanded(
              child: Container(
                child: membership == MembershipType.VIP
                    ? VIPPage()
                    : MembershipPage(),
              ),
            )
          ],
        ),
      ),
    );
  }

  void setSelectedState(MembershipType type) {
    setState(() {
      membership = type;
    });
  }
}
