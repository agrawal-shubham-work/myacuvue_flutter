import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/utilities/constants.dart';
import 'package:my_acuvue_flutter/widget_methods/Reward/AcuvueReward/slider_second.dart';
import 'slider_first.dart';
import 'package:my_acuvue_flutter/dialog/custom_dialog.dart';

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
        SliderSecond(widget.imagePath),
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
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => CustomDialog(
                title: "",
                description: "Cannot applied cupon. Device is not registered.",
                buttonText: "Okay",
              ),
            );
          },
          child: Text(
            'Get this Coupon',
            style: kReferBtn,
          ),
        ),
      ),
    );
  }
}
