import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/widget_methods/Reward/uper_container_reward.dart';

class UpperContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        upperContainerWidget('Available points :', '0'),
        upperContainerWidget('0 points expiring on ', 'Sep 29, 2019'),
      ],
    );
  }
}
