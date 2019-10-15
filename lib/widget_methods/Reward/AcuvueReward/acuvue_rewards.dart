import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/widget_methods/Reward/AcuvueReward/reward%20Slider.dart';

class AcuvueRewards extends StatefulWidget {
  @override
  _AcuvueRewardsState createState() => _AcuvueRewardsState();
}

class _AcuvueRewardsState extends State<AcuvueRewards> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        child: Column(
          children: <Widget>[
            acuvue_rewads_photo_Widget("images/acuuvue_rewards1.jpg", () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RewardsSlider(
                        "images/acuuvue_rewards1.jpg", "\$10", "2000")),
              );
            }),
            acuvue_rewads_photo_Widget("images/acuvue_rewards3.jpg", () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RewardsSlider(
                        "images/acuvue_rewards3.jpg", "\$20", "4000")),
              );
            }),
            acuvue_rewads_photo_Widget("images/acuvue_reawrds2.jpg", () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RewardsSlider(
                        "images/acuvue_reawrds2.jpg", "\$30", "6000")),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class acuvue_rewads_photo_Widget extends StatelessWidget {
  final String imagePath;
  final Function onTaped;

  acuvue_rewads_photo_Widget(this.imagePath, this.onTaped);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: onTaped,
        child: Container(
          padding: EdgeInsets.all(10.0),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ),
    );
  }
}
