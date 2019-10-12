import 'package:flutter/material.dart';

class AcuvueRewards extends StatefulWidget {
  @override
  _AcuvueRewardsState createState() => _AcuvueRewardsState();
}

class _AcuvueRewardsState extends State<AcuvueRewards> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        acuvue_rewads_photo_Widget("images/acuuvue_rewards1.jpg"),
        acuvue_rewads_photo_Widget("images/acuvue_rewards3.jpg"),
        acuvue_rewads_photo_Widget("images/acuvue_reawrds2.jpg"),
      ],
    );
  }
}

class acuvue_rewads_photo_Widget extends StatelessWidget {
  final String imagePath;

  acuvue_rewads_photo_Widget(this.imagePath);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: Image.asset(imagePath),
      ),
    );
  }
}
