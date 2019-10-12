import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/widget_methods/Reward/AcuvueReward/reward%20Slider.dart';

class AcuvueRewards extends StatefulWidget {
  @override
  _AcuvueRewardsState createState() => _AcuvueRewardsState();
}

class _AcuvueRewardsState extends State<AcuvueRewards> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        acuvue_rewads_photo_Widget("images/acuuvue_rewards1.jpg", () {
          RewardsSlider slider =
              RewardsSlider("images/acuuvue_rewards1.jpg", "\$10", "2000");
          Navigator.of(context).pushNamed(RewardsSlider.routeName);
        }),
        acuvue_rewads_photo_Widget("images/acuvue_rewards3.jpg", () {
          RewardsSlider slider =
              RewardsSlider("images/acuvue_rewards3.jpg", "\$20", "4000");
          Navigator.of(context).pushNamed(RewardsSlider.routeName);
        }),
        acuvue_rewads_photo_Widget("images/acuvue_reawrds2.jpg", () {
          RewardsSlider slider =
              RewardsSlider("images/acuvue_reawrds2.jpg", "\$30", "6000");
          Navigator.of(context).pushNamed(RewardsSlider.routeName);
        }),
      ],
    );
  }
}

class acuvue_rewads_photo_Widget extends StatelessWidget {
  final String imagePath;
  final Function onTaped;

  acuvue_rewads_photo_Widget(this.imagePath, this.onTaped);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTaped,
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: Image.asset(imagePath),
      ),
    );
  }
}
