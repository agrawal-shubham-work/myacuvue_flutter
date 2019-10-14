import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/widget_methods/Reward/AcuvueReward/acuvue_rewards.dart';
import 'package:my_acuvue_flutter/widget_methods/Reward/reward_btn_widget.dart';
import 'package:my_acuvue_flutter/widget_methods/Reward/uper_container_reward.dart';

class MainReward extends StatefulWidget {
  @override
  _MainRewardState createState() => _MainRewardState();
}

enum ScreenSelected {
  Wallet,
  AcuvuewReward,
  LifestyleReward,
}

class _MainRewardState extends State<MainReward> {
  ScreenSelected screenType = ScreenSelected.Wallet;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          upperContainer(),
          btnContainer(),
          screenType == ScreenSelected.Wallet
              ? createWalletContainer()
              : screenType == ScreenSelected.AcuvuewReward
                  ? AcuvueRewards()
                  : createLifestyleRewardContainer(),
        ],
      ),
    );
  }

  Widget upperContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        upperContainerWidget('Available points :', '0'),
        upperContainerWidget('0 points expiring on ', 'Sep 29, 2019'),
      ],
    );
  }

  Widget createWalletContainer() {
    return Expanded(
      child: Container(
        color: Colors.red,
      ),
    );
  }

  Widget createAcuvueRewardContainer() {
    return Expanded(
      child: Container(
        color: Colors.greenAccent,
      ),
    );
  }

  Widget createLifestyleRewardContainer() {
    return Expanded(
      child: Container(
        color: Colors.orange,
      ),
    );
  }

  Widget btnContainer() {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RewardBtnWidget('Wallet', () {
            _selectedState(ScreenSelected.Wallet);
          }),
          RewardBtnWidget('ACUVUE Rewards', () {
            _selectedState(ScreenSelected.AcuvuewReward);
          }),
          RewardBtnWidget('Lifestyle Rewards', () {
            _selectedState(ScreenSelected.LifestyleReward);
          }),
        ],
      ),
    );
  }

  void _selectedState(ScreenSelected selectedState) {
    setState(() {
      screenType = selectedState;
    });
  }
}
