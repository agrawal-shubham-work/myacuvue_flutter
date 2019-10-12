import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/utilities/constants.dart';

class RewardsSlider extends StatefulWidget {
  static const String routeName = '/rewardslider';
  final String imagePath, data, points;

  RewardsSlider(this.imagePath, this.data, this.points);

  @override
  _RewardsSliderState createState() => _RewardsSliderState();
}

class _RewardsSliderState extends State<RewardsSlider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reward Description'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: <Widget>[
            Expanded(
              child: listViewContainer(widget.imagePath, widget.data),
            ),
            bottomButton()
          ],
        ),
      ),
    );
  }

  Widget listViewContainer(String imagePath, String data) {
    return Container(
        child: ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        new reward_detail_widget(widget.imagePath, widget.data, widget.points),
        Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.red,
          child: Text(
            'Second',
            style: kReferBtn,
          ),
        ),
      ],
    ));
  }

  Widget bottomButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 40.0,
        margin: EdgeInsets.all(10.0),
        color: Color(0xFF013F7C),
        width: double.infinity,
        child: FlatButton(
          child: Text(
            'Get this Coupon',
            style: kReferBtn,
          ),
        ),
      ),
    );
  }
}

class reward_detail_widget extends StatelessWidget {
  final String imagePath, data, points;

  reward_detail_widget(this.imagePath, this.data, this.points);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Image.asset(
              imagePath,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '$data ACUVUE Rewards',
                    style: kRewardsHeading,
                  ),
                  Text(
                    'Redeem with $points Points',
                    style: kRewardsSubHeading,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
