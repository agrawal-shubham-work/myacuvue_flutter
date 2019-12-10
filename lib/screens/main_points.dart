import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/utilities/constants.dart';

class Points extends StatefulWidget {
  @override
  _PointsState createState() => _PointsState();
}

class _PointsState extends State<Points> {
  TextAlign start = TextAlign.start;
  TextAlign center = TextAlign.center;
  double height = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        mainContainer(),
        transactionList(),
      ],
    );
  }

  Widget mainContainer() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(bottom: 5.0),
      decoration: BoxDecoration(
        color: Color(0xFFD5D9DA),
        border: Border(
          bottom: BorderSide(color: Colors.grey),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CreatePointsTextFields(
            "${height.toInt()} Points",
            kRewardTerms,
            center,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 0.0),
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                inactiveTrackColor: Colors.grey,
                activeTrackColor: Colors.grey,
                thumbColor: Color(0xff013f7c),
                overlayColor: Color(0x29EB1555),
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 3.0),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 5.0),
              ),
              child: Slider(
                value: height,
                min: 0,
                max: 6000,
                onChanged: (double newValue) {
                  setState(() {
                    height = newValue;
                  });
                },
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
            child: Row(
              children: <Widget>[
                sliderText("0", start),
                sliderText("", start),
                sliderText("Member", center),
                sliderText("", start),
                sliderText("6000", TextAlign.end),
              ],
            ),
          ),
          CreatePointsTextFields(
            "Points to reach VIP Member: 6000",
            kPointsTextStyle,
            start,
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10.0, left: 10.0),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey),
              ),
            ),
            child: Container(
              padding: EdgeInsets.only(left: 10.0, bottom: 10.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'By : ',
                    style: kPointsTextStyle,
                  ),
                  Text(
                    'Sep 29, 2019',
                    style: kNotificationDate,
                  ),
                ],
              ),
            ),
          ),
          CreatePointsTextFields(
            "Points going to expire",
            kPointsTextStyle,
            start,
          ),
          Container(
            padding: EdgeInsets.only(left: 15.0, bottom: 10.0),
            child: Row(
              children: <Widget>[
                pointsExpiryMonth("Current month :", "0"),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text(
                    '|',
                    style: kPointsExpiryText,
                  ),
                ),
                pointsExpiryMonth("Next month :", "0"),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container pointsExpiryMonth(String monthText, String pointsText) {
    return Container(
      child: Row(
        children: <Widget>[
          Text(
            monthText,
            style: kPointsExpiryText,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: Text(
              pointsText,
              style: kNotificationDate,
            ),
          ),
        ],
      ),
    );
  }

  Widget sliderText(String text, TextAlign align) {
    return Expanded(
      child: Container(
        child: Text(
          text,
          style: kNotificationDate,
          textAlign: align,
        ),
      ),
    );
  }

  Padding CreatePointsTextFields(
      String text, TextStyle style, TextAlign align) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(10.0),
        width: MediaQuery.of(context).size.width,
        child: Text(
          text,
          style: style,
          textAlign: align,
        ),
      ),
    );
  }

  Widget transactionList() {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Text(
            'No Transaction Done',
            style: kRewardTerms,
          ),
        ),
      ),
    );
  }
}
