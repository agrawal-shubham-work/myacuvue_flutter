import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/widget_methods/Reward/AcuvueReward/reward%20Slider.dart';
import 'package:transparent_image/transparent_image.dart';

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
            acuvue_rewads_photo_Widget(
                "https://firebasestorage.googleapis.com/v0/b/myacuvue-252019.appspot.com/o/acuuvue_rewards1.jpg?alt=media&token=20d04c63-4f18-4fdd-86f1-c72f593bac1f",
                () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RewardsSlider(
                        "https://firebasestorage.googleapis.com/v0/b/myacuvue-252019.appspot.com/o/ac_rewards_1.jpg?alt=media&token=286f5051-b1c7-43f8-b7be-9eea0b8e0dca",
                        "\$10",
                        "2000")),
              );
            }),
            acuvue_rewads_photo_Widget(
                "https://firebasestorage.googleapis.com/v0/b/myacuvue-252019.appspot.com/o/acuvue_rewards3.jpg?alt=media&token=2d6d62f7-4871-4145-a1d1-fec852880279",
                () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RewardsSlider(
                        "https://firebasestorage.googleapis.com/v0/b/myacuvue-252019.appspot.com/o/ac_rewards_3.jpg?alt=media&token=e5d88298-7e73-4072-b888-03f5d1de65f3",
                        "\$20",
                        "4000")),
              );
            }),
            acuvue_rewads_photo_Widget(
                "https://firebasestorage.googleapis.com/v0/b/myacuvue-252019.appspot.com/o/acuvue_reawrds2.jpg?alt=media&token=bcf34cd8-4f1b-44e9-8c4e-2eedd0fbcd17",
                () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RewardsSlider(
                        "https://firebasestorage.googleapis.com/v0/b/myacuvue-252019.appspot.com/o/ac_rewards_2.jpg?alt=media&token=93f5f70e-64e3-441e-92a7-8acfdb6c7db8",
                        "\$30",
                        "6000")),
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
          child: Stack(
            children: <Widget>[
              Center(child: CircularProgressIndicator()),
              Center(
                child: FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: imagePath,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
