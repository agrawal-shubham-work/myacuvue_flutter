import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/utilities/constants.dart';
import 'package:transparent_image/transparent_image.dart';

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
            child: Stack(
              children: <Widget>[
                Center(child: CircularProgressIndicator()),
                Center(
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: imagePath,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
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
