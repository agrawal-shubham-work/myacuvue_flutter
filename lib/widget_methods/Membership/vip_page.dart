import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/utilities/constants.dart';
import 'box_one_text.dart';
import 'box_two_text.dart';
import 'final _text.dart';

class VIPPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey))),
              margin: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'VIP Member',
                    style: kVipHeading,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15.0, bottom: 15.0),
                    child: Text(
                      mVipText,
                      style: kVipText,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            CreateBoxWithTwoText(
                "images/vip_star.png", "Earn 12 points", "for every \$1 spent"),
            CreateBoxWithTwoText("images/vip_cake_star.png", "Earn 24 points",
                "for every \$1 spent \n on your birthday"),
            CreateBoxWithTwoText(
                "images/vip_star.png", "Welcome Gift", "MyACUVUE points"),
            CreateBoxWithOneText(
                "images/vip_gift.png", "Exclusive VIP Rewards"),
            CreateBoxWithOneText(
                "images/vip_home.png", "Exchange points for rewards"),
            final_text_member(),
          ],
        )
      ],
    );
  }
}
